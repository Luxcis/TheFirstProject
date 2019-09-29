package com.yonghe.bootyh.controller;

import com.yonghe.bootyh.pojo.Door;
import com.yonghe.bootyh.pojo.Order;
import com.yonghe.bootyh.service.DoorService;
import com.yonghe.bootyh.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Author: Luxcis
 * @Date: 2019/9/19 11:32
 * @Version: 1.0
 * @Description:
 */
@Controller
public class OrderController {

    @Autowired(required = false)
    private OrderService os;
    @Autowired(required = false)
    private DoorService ds;

    /**查询所有订单*/
    @RequestMapping("/orderList")
    public String orderList(Model model){
        //查询所有门店信息,返回集合
        List<Door> dList = ds.findAll();
        //将门店集合存入modle中
        model.addAttribute("dList",dList);
		List<Order> olist= os.findAll();
		model.addAttribute("olist",olist);
        return "order_list";
    }

    /**查询所有门店列表bin跳转到新增页面*/
    @RequestMapping("/toOrderAdd")
    public String toOrderAdd(Model model){
        List<Door> dList = ds.findAll();
        model.addAttribute("dList",dList);
        return "order_add";
    }

    /**添加订单*/
    @RequestMapping("/orderAdd")
    public String orderAdd(Order order){
        os.addOrder(order);
        return "forward:/orderList";
    }

    /**删除订单*/
    @RequestMapping("/orderDelete")
    public String orderDelete(Integer id){
        os.deleteById(id);
        return "forward:/orderList";
    }

    /**根据id查询订单信息*/
    @RequestMapping("/orderInfo")
    public String orderInfo(Integer id,Model model){
        List<Door> dList = ds.findAll();
        model.addAttribute("dList",dList);
        Order order = os.findById(id);
        model.addAttribute("order",order);
        System.out.println(order);
        return "order_update";
    }

    /***/
    @RequestMapping("/orderUpdate")
    public String orderUpdate(Order order){
        os.updateById(order);
        return "forward:/orderList";
    }


}
