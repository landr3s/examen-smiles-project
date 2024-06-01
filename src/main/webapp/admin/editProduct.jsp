<!-- WebContent/admin/editProduct.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Product" %>
<%@ page import="dao.ProductDAO" %>

<%
    int productId = Integer.parseInt(request.getParameter("productId"));
    ProductDAO productDAO = new ProductDAO();
    Product product = productDAO.getProductById(productId);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Editar Producto</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <%@ include file="../template/headerAdmin.jsp" %>
    <section>
        <h2>Editar Producto</h2>
        <form id="edit-product-form">
            <input type="hidden" name="productId" value="<%= product.getId() %>">
            <label for="title">Título:</label>
            <input type="text" id="title" name="title" value="<%= product.getTitle() %>">
            <label for="description">Descripción:</label>
            <textarea id="description" name="description"><%= product.getDescription() %></textarea>
            <label for="quantity">Cantidad:</label>
            <input type="number" id="quantity" name="quantity" value="<%= product.getQuantity() %>">
            <label for="price">Precio:</label>
            <input type="number" step="0.01" id="price" name="price" value="<%= product.getPrice() %>">
            <button type="button" id="update-product-btn">Actualizar</button>
        </form>
        <p id="update-message"></p>
    </section>
    <%@ include file="../template/footer.jsp" %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $("#update-product-btn").click(function() {
                var formData = $("#edit-product-form").serialize();

                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/EditProductServlet",
                    data: formData,
                    success: function(response) {
                        $("#update-message").text("Producto actualizado correctamente.");
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                        $("#update-message").text("Hubo un error al actualizar el producto.");
                    }
                });
            });
        });
    </script>
</body>
</html>
