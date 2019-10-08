package cn.tedu.web;

import cn.tedu.exception.MsgException;
import cn.tedu.factory.BasicFactory;
import cn.tedu.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author: Luxcis
 * @Date: 2019/9/19 19:14
 * @Version: 1.0
 * @Description:
 */
public class OrderDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        //1、接收订单id
        String id = request.getParameter("id");
        //2、创建业务层对象
        OrderService orderService = BasicFactory.getFactory().
                getInstance(OrderService.class);
        try{
            //3、调用业务层删除的方法
            orderService.deleteOrderByOid(id);
            //4、提示删除成功
            response.getWriter().write("订单删除成功，2秒后自动跳转...");
        }catch (MsgException e) {
            //4、提示删除失败
            response.getWriter().write("订单删除失败,2秒后自动跳转...");
        }
        //5、设置自动跳转
        response.setHeader("refresh", "2;url="+
                request.getContextPath()+
                "/servlet/OrderListServlet");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
