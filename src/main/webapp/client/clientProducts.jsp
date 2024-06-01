<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="model.Cart" %>
<%@ page import="model.CartItem" %>
<%@ page import="dao.ProductDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    ProductDAO productDAO = new ProductDAO();
    List<Product> products = productDAO.getAllProducts();
    Cart cart = (Cart) session.getAttribute("cart");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Productos</title>
    <link rel="stylesheet" href="../css/styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
    <%@ include file="../template/header.jsp" %>
    <section>
        <h2>Productos</h2>
        <ul>
            <% for (Product product : products) { %>
                <li>
                    <h3><%= product.getTitle() %></h3>
                    <p><%= product.getDescription() %></p>
                    <p>Precio: <%= product.getPrice() %></p>
                    <p>Disponible: <%= product.getQuantity() %></p>
                    <button type="button" class="add-to-cart" data-product-id="<%= product.getId() %>">Agregar al Carrito</button>
                </li>
            <% } %>
        </ul>

        <h2>Carrito de Compras</h2>
        <div id="cart">
            <ul id="cart-items">
                <% if (cart != null && cart.getItems() != null) { %>
                    <% for (CartItem item : cart.getItems().values()) { %>
                        <li>
                            <h3><%= item.getProduct().getTitle() %></h3>
                            <p>Cantidad: <%= item.getQuantity() %></p>
                            <p>Precio Unitario: <%= item.getProduct().getPrice() %></p>
                            <p>Subtotal: <%= item.getProduct().getPrice() * item.getQuantity() %></p>
                            <button type="button" class="remove-from-cart" data-product-id="<%= item.getProduct().getId() %>">Eliminar</button>
                        </li>
                    <% } %>
                <% } else { %>
                    <p>El carrito está vacío.</p>
                <% } %>
            </ul>
            <p id="cart-total">Total: <%= cart != null ? cart.getTotal() : 0.0 %></p>
            <button type="button" id="checkout">Pagar</button>
            <button type="button" id="clear-cart">Cancelar Pedido</button>
        </div>
    </section>

    <script>
        $(document).ready(function() {
            $(".add-to-cart").click(function() {
                var productId = $(this).data("product-id");

                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/AddToCartServlet",
                    data: { productId: productId },
                    success: function(response) {
                        // Actualizar el carrito
                        updateCart(response);
                    }
                });
            });

            $("#cart").on("click", ".remove-from-cart", function() {
                var productId = $(this).data("product-id");

                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/RemoveFromCartServlet",
                    data: { productId: productId },
                    success: function(response) {
                        // Actualizar el carrito
                        updateCart(response);
                    }
                });
            });

            $("#checkout").click(function() {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/CheckoutServlet",
                    success: function(response) {
                        alert("Pedido completado con éxito.");
                        updateCart(response);
                    }
                });
            });

            $("#clear-cart").click(function() {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/ClearCartServlet",
                    success: function(response) {
                        updateCart(response);
                    }
                });
            });

            function updateCart(cart) {
                var cartItems = $("#cart-items");
                cartItems.empty();

                $.each(cart.items, function(index, item) {
                    cartItems.append("<li>" +
                        "<h3>" + item.product.title + "</h3>" +
                        "<p>Cantidad: " + item.quantity + "</p>" +
                        "<p>Precio Unitario: " + item.product.price + "</p>" +
                        "<p>Subtotal: " + (item.product.price * item.quantity) + "</p>" +
                        "<button type='button' class='remove-from-cart' data-product-id='" + item.product.id + "'>Eliminar</button>" +
                        "</li>");
                });

                $("#cart-total").text("Total: " + cart.total);
            }
        });
    </script>
</body>
</html>
