package cn.tedu.web;

import cn.tedu.bean.OrderInfo;
import cn.tedu.factory.BasicFactory;
import cn.tedu.service.OrderService;
import cn.tedu.bean.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Author: Luxcis
 * @Date: 2019/9/17 9:22
 * @Description:
 */
public class OrderListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        //1.获取当前登陆用户
        User user = (User) request.getSession().getAttribute("user");
        //2.调用service层根据用户id查询当前用户的所有订单信息
        if(user!=null){
            //用户:张飞 2个订单
            OrderService service = BasicFactory.getFactory().getInstance(OrderService.class);

            /*
             * OrderInfo中保存的是一个完整的订单信息, 一个完整订单中应该包含:
             * Order
             * Map<Product, Integer>(OrderItem(Product, buyNum))
             */
            List<OrderInfo> list = service.findOrderByUserId(user.getId());

            //3.将所有订单信息存入request域
            request.setAttribute("list", list);

            //4.利用转发将所有订单信息带到订单列表页面进行展示!
            request.getRequestDispatcher("/order_list.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
