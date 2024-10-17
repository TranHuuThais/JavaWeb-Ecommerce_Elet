package thai.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import thai.dev.data.dao.DatabaseDao;
import thai.dev.data.dao.OrderDao;
import thai.dev.data.model.Order;
import thai.dev.data.model.User;

public class OrderStatusServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("LoginServlet");
            return;
        }

        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();

        List<Order> orderList = orderDao.findByUser(user.getId());

        request.setAttribute("orderList", orderList);
        System.out.println("order.product");
        // Forward the request to the order status JSP page
        request.getRequestDispatcher("/orderStatus.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
