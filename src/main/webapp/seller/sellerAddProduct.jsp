<!-- WebContent/seller/sellerAddProduct.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Agregar Producto</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <%@ include file="../template/headerSeller.jsp" %>
    <section>
        <h2>Agregar Nuevo Producto</h2>
        <% if (request.getParameter("success") != null) { %>
            <p class="success">Producto agregado correctamente.</p>
        <% } %>
        <form action="${pageContext.request.contextPath}/AddProductServlet" method="post">
            <label for="title">Título:</label>
            <input type="text" id="title" name="title" required><br>

            <label for="description">Descripción:</label>
            <textarea id="description" name="description" required></textarea><br>

            <label for="quantity">Cantidad:</label>
            <input type="number" id="quantity" name="quantity" required><br>

            <label for="price">Precio:</label>
            <input type="number" step="0.01" id="price" name="price" required><br>

            <input type="submit" value="Agregar Producto">
        </form>
    </section>
    <%@ include file="../template/footer.jsp" %>
</body>
</html>
