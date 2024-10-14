package thai.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import thai.dev.data.dao.CategoryDao;
import thai.dev.data.dao.DatabaseDao;
import thai.dev.data.dao.ProductDao;
import thai.dev.data.model.Category;
import thai.dev.data.model.Product;
import thai.dev.util.Constants;

public class CategoryServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);

        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();

        // Get category information
        Category category = categoryDao.find(categoryId);
        request.setAttribute("category", category);

        // Pagination handling
        int currentPage = 1;
        try {
            currentPage = Math.max(1, Integer.parseInt(request.getParameter("page")));
        } catch (NumberFormatException e) {
            // Default to 1 if no valid "page" parameter
        }

        int offset = (currentPage - 1) * Constants.PER_PAGE;
        int limit = Constants.PER_PAGE;

        // Get total number of products in the category
        int totalProducts = productDao.countByCategory(categoryId);
        int totalPages = (int) Math.ceil((double) totalProducts / Constants.PER_PAGE);

        // Apply filtering and pagination
        List<Product> productList;
        String sort = request.getParameter("sort");
        String order = request.getParameter("order");

        if (sort != null && order != null) {
            productList = productDao.filter(categoryId, order, offset,limit);
        } else {
            productList = productDao.findByCategory(categoryId, offset, limit);
        }

        // Set data in request to display on JSP
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalProducts", totalProducts);
        request.setAttribute("productList", productList);

        // Forward to category.jsp
        request.getRequestDispatcher("category.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle POST requests if needed
    }
}
