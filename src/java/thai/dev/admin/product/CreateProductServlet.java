package thai.dev.admin.product;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import thai.dev.admin.BaseAdminServlet;
import thai.dev.data.dao.CategoryDao;
import thai.dev.data.dao.DatabaseDao;
import thai.dev.data.dao.ProductDao;
import thai.dev.data.model.Category;
import thai.dev.data.model.Product;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@MultipartConfig
public class CreateProductServlet extends BaseAdminServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = categoryDao.findAll();
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("admin/product/create.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        Part filePart = request.getPart("thumbnail");
        double price;
        int quantity;
        int categoryId;

        // Validate inputs
        if (name == null || name.isEmpty() || description == null || description.isEmpty() || 
            filePart.getSize() == 0 || !filePart.getContentType().startsWith("image/") || 
            (price = parsePrice(request.getParameter("price"))) < 0 || 
            (quantity = parseQuantity(request.getParameter("quantity"))) < 0 || 
            (categoryId = parseCategoryId(request.getParameter("categoryId"))) < 0) {
            request.setAttribute("error", "Please fill in all fields correctly.");
            request.getRequestDispatcher("admin/product/create.jsp").include(request, response);
            return;
        }

        // Define where to save the uploaded files
        String uploadsDir = getServletContext().getRealPath("/uploads");
        Path uploadPath = Paths.get(uploadsDir);
        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        // Generate a unique file name
        String fileName = UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();
        Path filePath = uploadPath.resolve(fileName);

        // Save the file
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, filePath);
        } catch (IOException e) {
            request.setAttribute("error", "File upload failed: " + e.getMessage());
            request.getRequestDispatcher("admin/product/create.jsp").include(request, response);
            return;
        }

        // Create product instance and insert
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        Product product = new Product(quantity, description, fileName, name, price, categoryId);
        productDao.insert(product);

        // Redirect
        response.sendRedirect("IndexProductServlet");
    }

    private double parsePrice(String priceStr) {
        try {
            return Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            return -1; // Invalid price
        }
    }

    private int parseQuantity(String quantityStr) {
        try {
            return Integer.parseInt(quantityStr);
        } catch (NumberFormatException e) {
            return -1; // Invalid quantity
        }
    }

    private int parseCategoryId(String categoryIdStr) {
        try {
            return Integer.parseInt(categoryIdStr);
        } catch (NumberFormatException e) {
            return -1; // Invalid category ID
        }
    }
}
