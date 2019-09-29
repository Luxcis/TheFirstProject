package com.yonghe.bootyh.controller;

import com.yonghe.bootyh.mapper.DoorMapper;
import com.yonghe.bootyh.pojo.Door;
import com.yonghe.bootyh.service.DoorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author Luxcis
 * @version 1.0
 * @date 2019/9/26 11:43
 * @description
 */
@Controller
public class DoorController {
    @Autowired(required = false)
    private DoorService dr;

    @RequestMapping("/doorList")
    public String doorList(Model model){
        List<Door> list = dr.findAll();
        model.addAttribute("list",list);
        return "door_list";
    }

    /**删除门店信息*/
    @RequestMapping("/doorDelete")
    public String doorDelete(Integer id){
        dr.deleteById(id);
        return "forward:/doorList";
    }

    /**新增门店信息*/
    @RequestMapping("/doorAdd")
    public String doorAdd(Door door){
        //调用dr的addDoor方法添加门店信息
        dr.addDoor(door);
        //新增后跳转回门店列表页面,显示最新列表
        return "forward:/doorList";
    }

    /**根据id查询门店信息*/
    @RequestMapping("/doorInfo")
    public String doorInfo(Integer id,Model model){
        Door door=dr.findById(id);
        //将门店信息存入model中
        model.addAttribute("door",door);
        //转发到门店修改页面,进行数据的回显
        return "door_update";
    }


    /**修改门店信息*/
    @RequestMapping("/doorUpdate")
    public String doorUpdate(Door door){
        dr.updateById(door);
        return "forward:/doorList";
    }

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping("/{pageName}")
    public String toPage(@PathVariable String pageName){
        return pageName;
    }

}
