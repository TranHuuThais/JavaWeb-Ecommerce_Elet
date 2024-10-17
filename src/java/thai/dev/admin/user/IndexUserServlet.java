package thai.dev.admin.user;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import thai.dev.admin.BaseAdminServlet;
import thai.dev.data.dao.DatabaseDao;
import thai.dev.data.dao.UserDAO;
import thai.dev.data.model.User;
import thai.dev.util.Constants;

public class IndexUserServlet extends BaseAdminServlet {

 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO userDao = DatabaseDao.getInstance().getUserDao();

        String pageParam = request.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        int totalUsers = userDao.countAll();
        int totalPages = (int) Math.ceil((double) totalUsers / Constants.PAGE_SIZE);

        currentPage = Math.max(1, Math.min(currentPage, totalPages));

        List<User> userList = userDao.findPaginated(currentPage, Constants.PAGE_SIZE);

        int pageSize = 6;
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("userList", userList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        // Forward to JSP
        request.getRequestDispatcher("admin/user/index.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
