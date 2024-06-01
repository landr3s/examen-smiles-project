<!-- WebContent/client/viewCart.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Cart" %>
<%@ page import="model.CartItem" %>
<%@ page import="model.Product" %>
<%@ page import="dao.ProductDAO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="dao.ProductDAO" %>

<%
    Cart cart = (Cart) request.getAttribute("cart");
    ProductDAO productDAO = new ProductDAO();
    Map<Integer, CartItem> items = (cart != null) ? cart.getItems() : new HashMap<>();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Carrito de Compras</title>
</head>
<body>
    <%@ include file="../template/header.jsp" %>
    <section>
        <h2>Carrito de Compras</h2>
        <table>
            <thead>
                <tr>
                    <th>Producto</th>
                    <th>Cantidad</th>
                </tr>
            </thead>
            <tbody>
                <% for (CartItem item : items.values()) {
                    Product product = productDAO.getProductById(item.getProduct().getId());
                %>
                <tr>
                    <td><%= product.getTitle() %></td>
                    <td><%= item.getQuantity() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </section>
    <%@ include file="../template/footer.jsp" %>
</body>
</html>
