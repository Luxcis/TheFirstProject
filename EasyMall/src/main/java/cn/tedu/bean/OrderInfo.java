package cn.tedu.bean;

import java.util.Map;

/**
 * @Author: Luxcis
 * @Date: 2019/9/17 9:47
 * @Description:
 */
public class OrderInfo {
    private Order order;//订单信息
    private Map<Product,Integer> map;//该订单下所有订单信息

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Map<Product, Integer> getMap() {
        return map;
    }

    public void setMap(Map<Product, Integer> map) {
        this.map = map;
    }
}
