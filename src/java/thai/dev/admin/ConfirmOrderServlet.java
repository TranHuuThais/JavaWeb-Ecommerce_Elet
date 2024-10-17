package thai.dev.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import thai.dev.data.dao.DatabaseDao;
import thai.dev.data.dao.OrderDao;
import thai.dev.data.model.Order;

public class ConfirmOrderServlet extends BaseAdminServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        
        Order order = orderDao.find(orderId);
        if (order != null) {
            order.setStatus(Order.FINISHED); // Update status to finished
            orderDao.update(order); // Ensure your update method works correctly
            request.setAttribute("message", "Order confirmed as finished.");
        } else {
            request.setAttribute("error", "Order not found.");
        }
        
        request.getRequestDispatcher("admin/order/index.jsp").forward(request, response); // Redirect to the order list or detail page
    }
}
