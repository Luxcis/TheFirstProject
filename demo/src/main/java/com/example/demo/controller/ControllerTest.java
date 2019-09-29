package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Luxcis
 * @version 1.0
 * @date 2019/9/29 9:39
 * @description
 */
@Controller
public class ControllerTest {
    /**设置通用页面跳转(必需)*/
    @RequestMapping("/{pageName}")
    public String toPage(@PathVariable String pageName){return pageName;}
}
