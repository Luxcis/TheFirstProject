package cn.tedu.service;

import cn.tedu.bean.*;
import cn.tedu.dao.OrderDao;
import cn.tedu.dao.ProdDao;
import cn.tedu.factory.BasicFactory;
import cn.tedu.bean.*;
import cn.tedu.exception.MsgException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Luxcis
 * @Date: 2019/9/19 20:41
 * @Version: 1.0
 * @Description:
 */
public class OrderServiceImpl {
    private OrderDao order_dao = BasicFactory.getFactory().getInstance(OrderDao.class);
    private ProdDao prod_dao = BasicFactory.getFactory().getInstance(ProdDao.class);

    public void addOrder(Order order, List<OrderItem> list) throws MsgException {
        //调用dao层的方法添加订单信息
        order_dao.addOrder(order);
        for (OrderItem orderItem : list) {
            //检查购买数量(orderItem.buyNum)是否小于等于库存数量(Product.pnum)
            //获取购买数量
            int buyNum = orderItem.getBuynum();
            //获取库存数量
            //>>获取商品id
            String pid = orderItem.getProduct_id();
            //>>查询商品信息
            Product prod = prod_dao.findProdById(pid);
            int pnum = prod.getPnum();
            if (buyNum > pnum) {//如果购买数量大于库存数量
                throw new MsgException("库存数量不足,id:" + pid + ",name:" + prod.getName() + ",pnum:" + prod.getPnum());
            }
            //调用dao层的方法添加订单项信息
            order_dao.addOrderItem(orderItem);
            //将购买数量从库存数量中扣除
            prod_dao.updatePnum(pid, prod.getPnum() - buyNum);
        }
    }

    public List<OrderInfo> findOrderByUserId(int userId) {
        //1.通过Userid查询当前用户的所有订单信息
        List<Order> orderList = order_dao.findOrderByUserId(userId);
        if (orderList == null) {
            return null;
        }
        List<OrderInfo> orderInfoList = new ArrayList<OrderInfo>();
        for (Order order : orderList) {
            //2.遍历每一个订单, 通过订单id查询当前订单中包含的所有订单项信息
            List<OrderItem> orderItemList = order_dao
                    .findOrderItemByOrderId(order.getId());
            //3.遍历每一个订单项, 通过订单项获取商品信息及商品的购买数量
            Map<Product, Integer> map = new HashMap<Product, Integer>();
            if (orderItemList != null) {
                for (OrderItem orderItem : orderItemList) {
                    //3.1.获取商品id, 通过商品id查询商品信息, 返回Product对象
                    Product prod = prod_dao.findProdById(orderItem.getProduct_id());
                    //3.2.获取购买数量
                    int buyNum = orderItem.getBuynum();
                    //3.3.将商品信息和购买数量存入map中
                    map.put(prod, buyNum);
                }
            }
            //4.将订单信息和所有的订单项信息存入OrderInfo中
            OrderInfo orderInfo = new OrderInfo();
            orderInfo.setOrder(order);
            orderInfo.setMap(map);

            //5.将一个完整的订单信息存入List集合中
            orderInfoList.add(orderInfo);
        }
        return orderInfoList;
    }

    public void deleteOrderByOid(String id) throws MsgException {
        //1、根据订单id查询订单信息
        Order order = order_dao.findOrderByOid(id);
        //2、判断订单是否存在
        if (order == null) {
            throw new MsgException("当前订单不存在！");
        }
        //3、判断当前订单是否未支付，只有未支付的订单才能删除
        if (order.getPaystate() != 0) {
            throw new MsgException("只有未支付的订单才能删除!");
        }
        //4、根据订单的id，查询当前订单下所有的订单项目
        List<OrderItem> items = order_dao.findOrderItemByOrderId(id);
        //5、遍历items
        if (items != null) {
            for (OrderItem item : items) {
                //6、还原商品的库存
                prod_dao.changePnum(item.getProduct_id(),
                        item.getBuynum());
            }
        }
        //7、删除该订单下所有的订单项目
        order_dao.deleteOrderItemsByOid(id);
        //8、删除该订单信息
        order_dao.deleteOrderByOid(id);
    }

    public Order findOrderByOid(String oid) {
        return order_dao.findOrderByOid(oid);
    }

    public void updatePaystateByOid(String oid, int paystate) {
        order_dao.updatePaystateByOid(oid, paystate);
    }

    public List<SaleInfo> findSaleInfos() {
        return order_dao.findSaleInfos();
    }

}
