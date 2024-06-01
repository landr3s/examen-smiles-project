<!-- WebContent/seller/sellerHome.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="dao.ProductDAO" %>

<%
    ProductDAO productDAO = new ProductDAO();
    List<Product> products = productDAO.getAllProducts();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Inicio Vendedor</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <%@ include file="../template/headerSeller.jsp" %>
    <section>
        <h2>Gestión de Stock</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Stock</th>
                    <th>Añadir Stock</th>
                </tr>
            </thead>
            <tbody>
                <% for (Product product : products) { %>
                    <tr>
                        <td><%= product.getId() %></td>
                        <td><%= product.getTitle() %></td>
                        <td><%= product.getQuantity() %></td>
                        <td>
                            <input type="number" class="stock-input" data-product-id="<%= product.getId() %>" min="0">
                            <button type="button" class="add-stock-btn" data-product-id="<%= product.getId() %>">Agregar</button>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </section>
    <%@ include file="../template/footer.jsp" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $(".add-stock-btn").click(function() {
                var productId = $(this).data("product-id");
                var quantity = $(this).siblings(".stock-input").val();

                if (quantity && quantity > 0) {
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/AddStockServlet",
                        data: { productId: productId, quantity: quantity },
                        success: function(response) {
                            alert("Stock actualizado correctamente.");
                            location.reload();
                        },
                        error: function(xhr, status, error) {
                            console.error(xhr.responseText);
                            alert("Hubo un error al actualizar el stock.");
                        }
                    });
                } else {
                    alert("Por favor, ingrese una cantidad válida.");
                }
            });
        });
    </script>
</body>
</html>
