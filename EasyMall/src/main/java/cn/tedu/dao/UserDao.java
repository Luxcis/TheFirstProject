package cn.tedu.dao;

import cn.tedu.bean.User;

/**
 * @Author: Luxcis
 * @Date: 2019/9/18 9:08
 * @Version: 1.0
 * @Description:
 */
public interface UserDao extends Dao{
    /**根据用户名查询用户是否存在*/
    public boolean FindUserByUsername(String username);
    /**将用户注册信息保存入数据库*/
    public void addUser(User user);
    /**根据用户名和密码查询用户*/
    public User FindUserByUsernameAndPassword(String username,String password);
}
