package thai.dev.admin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import thai.dev.data.dao.DatabaseDao;
import thai.dev.data.dao.OrderDao;
import thai.dev.data.model.Order;
import thai.dev.util.GetDateTime;

public class DashboardServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userRole = (String) session.getAttribute("role"); // Lấy vai trò từ session

        // Kiểm tra xem người dùng có phải là admin không
        if (userRole == null || !userRole.equals("admin")) {
            // Nếu không phải admin, chuyển hướng đến trang chủ
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        // Xử lý nếu người dùng là admin
        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String formattedDate = dtf.format(now);

        // Lấy thông tin đơn hàng
        List<Order> orderList = orderDao.findAll();
        int numberOrderToday = orderDao.countOrderByDay(formattedDate);
        int numberOrderAll = orderList.size();
        List<Order> orderPendingList = orderDao.findByStatus("pending");
        int numberOrderPending = orderPendingList.size();
        int numberOrderFinished = numberOrderAll - numberOrderPending;

        // Đặt các thuộc tính vào request
        request.setAttribute("numberOrderToday", numberOrderToday);
        request.setAttribute("numberOrderAll", numberOrderAll);
        request.setAttribute("numberOrderPending", numberOrderPending);
        request.setAttribute("numberOrderFinished", numberOrderFinished);

        // Chuẩn bị dữ liệu biểu đồ cho 7 ngày gần nhất
        List<String> dateList = GetDateTime.get7Date();
        List<Integer> orderByDateList = new ArrayList<>();
        for (String d : dateList) {
            int n = orderDao.countOrderByDay(d);
            orderByDateList.add(n);
        }
        request.setAttribute("orderByDateList", orderByDateList);
        request.setAttribute("dateList", dateList);
        request.setAttribute("orderList", orderList);
        request.setAttribute("orderPendingList", orderPendingList);

        // Chuyển tiếp đến trang dashboard
        request.getRequestDispatcher("admin/dashboard.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement any necessary POST handling here if needed
    }
}
