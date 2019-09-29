package com.yonghe.bootyh.service;

import com.yonghe.bootyh.mapper.DoorMapper;
import com.yonghe.bootyh.mapper.OrderMapper;
import com.yonghe.bootyh.pojo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author Luxcis
 * @version 1.0
 * @date 2019/9/29 14:46
 * @description
 */
@Service
public class OrderServiceImpl implements OrderService {
    @Autowired(required = false)
    private OrderMapper or;

    @Override
    public List<Order> findAll() {
        return or.findAll();
    }

    @Override
    public void addOrder(Order order) {
        or.addOrder(order);
    }

    @Override
    public void deleteById(Integer id) {
        or.deleteById(id);
    }

    @Override
    public Order findById(Integer id) {
        return or.findById(id);
    }

    @Override
    public void updateById(Order order) {
        or.updateById(order);
    }
}
