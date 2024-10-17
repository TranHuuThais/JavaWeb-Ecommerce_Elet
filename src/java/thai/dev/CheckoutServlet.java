/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package thai.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import thai.dev.data.dao.DatabaseDao;
import thai.dev.data.dao.OrderDao;
import thai.dev.data.dao.OrderItemDao;
import thai.dev.data.model.Order;
import thai.dev.data.model.OrderItem;
import thai.dev.data.model.User;
import thai.dev.util.StringHelper;

/**
 *
 * @author ACER
 */
public class CheckoutServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("LoginServlet");
        } else {
            processCheckout(request, user);
            response.sendRedirect("CartServlet");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

         

    private void processCheckout(HttpServletRequest request, User user) {
        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        String code = StringHelper.randomString(10);
        Order order = new Order(code, Order.PENDING, user.getId());
        orderDao.insert(order);

        // Find the order by code to retrieve the newly created order
        order = orderDao.findByCode(code);
        HttpSession session = request.getSession();

        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");
        OrderItemDao orderItemDao = DatabaseDao.getInstance().getOrderItemDao();
        if (cart != null) {
            for (OrderItem orderItem : cart) {
                orderItem.setOrderId(order.getId());
                orderItemDao.insert(orderItem);
            }
        }
        session.setAttribute("message", "Checkout Success");
        session.removeAttribute("cart");
    }

}
