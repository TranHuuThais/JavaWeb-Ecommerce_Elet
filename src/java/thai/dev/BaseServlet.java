package thai.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import thai.dev.data.dao.CategoryDao;
import thai.dev.data.dao.Database;
import thai.dev.data.dao.DatabaseDao;
import thai.dev.data.model.Category;

public class BaseServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        DatabaseDao.init(new Database());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = categoryDao.findAll();
        req.setAttribute("categoryList", categoryList);
    }
}
