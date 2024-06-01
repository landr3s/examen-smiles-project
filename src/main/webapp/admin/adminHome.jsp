<!-- WebContent/admin/adminHome.jsp -->
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
    <title>Inicio Administrador</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <%@ include file="../template/headerAdmin.jsp" %>
    <section>
        <h2>Gestión de Productos</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Título</th>
                    <th>Descripción</th>
                    <th>Cantidad</th>
                    <th>Precio</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% for (Product product : products) { %>
                    <tr>
                        <td><%= product.getId() %></td>
                        <td><%= product.getTitle() %></td>
                        <td><%= product.getDescription() %></td>
                        <td><%= product.getQuantity() %></td>
                        <td><%= product.getPrice() %></td>
                        <td>
                            <button type="button" class="modify-btn" data-product-id="<%= product.getId() %>">Modificar</button>
                            <button type="button" class="delete-btn" data-product-id="<%= product.getId() %>">Eliminar</button>
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
            $(".delete-btn").click(function() {
                var productId = $(this).data("product-id");

                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/DeleteProductServlet",
                    data: { productId: productId },
                    success: function(response) {
                        alert("Producto eliminado correctamente.");
                        location.reload();
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                        alert("Hubo un error al eliminar el producto.");
                    }
                });
            });

            $(".modify-btn").click(function() {
                var productId = $(this).data("product-id");
                window.location.href = "${pageContext.request.contextPath}/admin/editProduct.jsp?productId=" + productId;
            });
        });
    </script>
</body>
</html>
