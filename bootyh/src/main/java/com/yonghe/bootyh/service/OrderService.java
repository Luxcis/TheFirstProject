package com.yonghe.bootyh.service;

import com.yonghe.bootyh.pojo.Order;

import java.util.List;

/**
 * @author Luxcis
 * @version 1.0
 * @date 2019/9/29 14:45
 * @description
 */
public interface OrderService {
    /**查询所有订单信息*/
    List<Order> findAll();
    /**新增订单信息*/
    void addOrder(Order order);
    /**删除订单信息*/
    void deleteById(Integer id);
    /**根据id查询订单*/
    Order findById(Integer id);
    /**根据id修改订单信息*/
    void updateById(Order order);
}
