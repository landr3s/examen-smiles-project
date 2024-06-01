// src/controller/AddProductServlet.java
package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        Product product = new Product();
        product.setTitle(title);
        product.setDescription(description);
        product.setQuantity(quantity);
        product.setPrice(price);

        ProductDAO productDAO = new ProductDAO();
        productDAO.addProduct(product);

        response.sendRedirect(request.getContextPath() + "/seller/sellerAddProduct.jsp?success=true");
    }
}
