package cn.tedu.factory;

import cn.tedu.util.TranManager;
import cn.tedu.anno.Tran;
import cn.tedu.dao.Dao;
import cn.tedu.service.Service;

import java.io.FileInputStream;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.Properties;

/**
 * @Author: Luxcis
 * @Date: 2019/9/17 20:44
 * @Version: 1.0
 * @Description: 通用工厂类
 */
public class BasicFactory {
    private static BasicFactory factory = new BasicFactory();
    private static Properties prop = new Properties();

    public static BasicFactory getFactory() {
        return factory;
    }

    private BasicFactory(){
    }

    static {
        //读取配置文件信息
        try {
            String confPath=BasicFactory.class.getClassLoader()
                    .getResource("conf.properties").getPath();
            prop.load(new FileInputStream(confPath));
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
    //根据配置文件创建UserDao实例
    public <T> T getInstance(Class<T> clazz){
        try {
            //读取配置文件的信息(UserDao实现类)
            String className=prop.getProperty(clazz.getSimpleName());
            //根据类全限定名获取类Class对象
            Class clz=Class.forName(className);
            //利用反射创建类实例
            //区分Service层对象还是Dao层对象
            if(Service.class.isAssignableFrom(clz)){
                final T t=(T) clz.newInstance();
                //service层 创建代理对象
                @SuppressWarnings("unckecked")
                T proxy = (T) Proxy.newProxyInstance(clz.getClassLoader(),
                        clz.getInterfaces(),
                        new InvocationHandler() {
                            @Override
                            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                                Object result = null;
                                //判断method上是否使用事务注解@Tran
                                if(method.isAnnotationPresent(Tran.class)){
                                    //使用了事务
                                    try{//开启事务
                                        TranManager.startTran();
                                        //执行委托类对象（真实对象）的方法
                                        result = method.invoke(t, args);
                                        //提交事务
                                        TranManager.commitTran();
                                    }catch (InvocationTargetException e) {
                                        e.printStackTrace();
                                        //回滚事务
                                        TranManager.rollbackTran();
                                        throw e.getTargetException();
                                    }finally{//释放事务中使用数据库连接
                                        TranManager.releseTran();
                                    }
                                }else{//未使用事务
                                    try{
                                        result = method.invoke(t, args);
                                    }catch (InvocationTargetException e) {
                                        e.printStackTrace();
                                        throw e.getTargetException();
                                    }finally{
                                        TranManager.releseTran();
                                    }
                                }
                                return result;
                            }
                        });
                return proxy;
            }else if(Dao.class.isAssignableFrom(clz)){
                //dao层
                return (T) clz.newInstance();
            }else{//既不是service也不是dao层
                System.out.println("别捣乱....");
                return null;
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
