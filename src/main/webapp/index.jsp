<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="model.Product" %>
<%@ page import="dao.ProductDAO" %>

<%
    ProductDAO productDAO = new ProductDAO();
    List<Product> products = productDAO.getAllProducts();
    String sortBy = request.getParameter("sortBy");
    
    // Ordenar la lista de productos si se selecciona un tipo de orden
    if (sortBy != null && !sortBy.isEmpty()) {
        if (sortBy.equals("name")) {
            Collections.sort(products, new Comparator<Product>() {
                @Override
                public int compare(Product p1, Product p2) {
                    return p1.getTitle().compareTo(p2.getTitle());
                }
            });
        } else if (sortBy.equals("price")) {
            Collections.sort(products, new Comparator<Product>() {
                @Override
                public int compare(Product p1, Product p2) {
                    return Double.compare(p1.getPrice(), p2.getPrice());
                }
            });
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gojos - Inicio</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    
    <style type="text/css">
    /* Estilos para el header */
header {
    background-color: #333;
    color: white;
    padding: 10px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

header nav ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

header nav ul li {
    display: inline;
    margin: 0 10px;
}

header nav ul li a {
    color: white;
    text-decoration: none;
}

/* Estilos para la sección de desarrollador */
.developer-section {
    background-color: #f9f9f9;
    padding: 20px;
    margin-top: 20px;
    border-radius: 5px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.developer-section a {
    color: #007bff;
    text-decoration: none;
}

.developer-section a:hover {
    text-decoration: underline;
}
    
    </style>
    
</head>
<body>
    <%@ include file="template/headerMain.jsp" %>
    <main>
        <section>
            <h1>Bienvenido a Gojos</h1>
            <p>Gojos es tu tienda de fitness de confianza. Ofrecemos productos de alta calidad para ayudarte a alcanzar tus metas de salud y bienestar.</p>
            <p>Explora nuestra amplia gama de suplementos, equipos de entrenamiento y accesorios para un estilo de vida saludable.</p>
            <p>¡Comienza tu viaje hacia un mejor tú con Gojos!</p>
        </section>

        <section>
            <h2>Productos</h2>
            <form action="${pageContext.request.contextPath}/index.jsp" method="get">
                <label for="sortBy">Ordenar por:</label>
                <select id="sortBy" name="sortBy">
                    <option value="">Sin orden</option>
                    <option value="name">Nombre</option>
                    <option value="price">Precio</option>
                </select>
                <button type="submit">Ordenar</button>
            </form>
            <ul>
                <% for (Product product : products) { %>
                    <li>
                        <h3><%= product.getTitle() %></h3>
                        <p><%= product.getDescription() %></p>
                        <p>Precio: <%= product.getPrice() %></p>
                        <p>Disponible: <%= product.getQuantity() %></p>
                    </li>
                <% } %>
            </ul>
        </section>
    </main>
    <%@ include file="template/footer.jsp" %>

    <!-- Sección de desarrollador -->
    <section class="developer-section">
        <p>Este proyecto fue desarrollado por <a href="https://github.com/landr3s">Andres Guaman</a>.</p>
        <p>Encuéntrame en LinkedIn: <a href="https://www.linkedin.com/in/andrés-guamán-957320311">Andres Guaman</a>.</p>
    </section>
</body>
</html>
