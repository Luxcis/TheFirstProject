package com.yonghe.bootyh.mapper;

import com.yonghe.bootyh.pojo.Order;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author: Luxcis
 * @Date: 2019/9/19 11:32
 * @Version: 1.0
 * @Description:
 */
@Mapper
public interface OrderMapper {
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
