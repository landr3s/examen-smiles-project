package controller;

import dao.ProductDAO;
import model.Cart;
import model.CartItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {

    private ProductDAO productDAO;

    @Override
    public void init() {
        productDAO = new ProductDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart != null) {
            for (CartItem item : cart.getItems().values()) {
                int productId = item.getProduct().getId();
                int purchasedQuantity = item.getQuantity();
                productDAO.updateProductQuantity(productId, -purchasedQuantity);
            }
            cart.clear();
            session.setAttribute("cart", cart);
        }

        response.sendRedirect("orderConfirmation.jsp");
    }
}
