// src/controller/EditProductServlet.java
package controller;

import dao.ProductDAO;
import model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/EditProductServlet")
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            double price = Double.parseDouble(request.getParameter("price"));

            Product product = new Product();
            product.setId(productId);
            product.setTitle(title);
            product.setDescription(description);
            product.setQuantity(quantity);
            product.setPrice(price);

            ProductDAO productDAO = new ProductDAO();
            productDAO.updateProduct(product);

            response.getWriter().write("Producto actualizado correctamente.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Hubo un error al actualizar el producto.");
        }
    }
}
