/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package thai.dev;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import thai.dev.data.dao.DatabaseDao;
import thai.dev.data.dao.ProductDao;
import thai.dev.data.model.Product;
import thai.dev.util.Constants;
import thai.dev.util.QRCodeUtil;

/**
 *
 * @author ACER
 */
public class ProductServelt extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        Product product = productDao.find(productId);
        List<Product> newsProductList = productDao.news(Constants.NUMBER_EVENT);

        String qrCodeData = "Product ID: " + productId + "\n"
                + "Product Name: " + product.getName() + "\n"
                + "Product Image: " + product.getThumbnail() + "\n"
                + "Price: " + product.getPrice();

        String qrCodeImage = QRCodeUtil.generateQRCodeImage(qrCodeData);

        request.setAttribute("newsProductList", newsProductList);
        request.setAttribute("product", product);
        request.setAttribute("qrCodeImage", qrCodeImage);

        request.getRequestDispatcher("product.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
