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
    
   <style> 
	   .welcome-section {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 50px 20px;
		    background-color: #f9f9f9;
		    border-radius: 10px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}

		.welcome-content {
		    flex: 1;
		    padding-right: 20px;
		}
		
		.welcome-content h1 {
		    font-size: 2.5em;
		    margin-bottom: 20px;
		}
		
		.welcome-content p {
		    font-size: 1.1em;
		    line-height: 1.6;
		    margin-bottom: 15px;
		}
		
		.image-container {
		    flex: 1;
		    text-align: center;
		}
		
		.image-container img {
		    max-width: 100%;
		    border-radius: 10px;
		    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		}
				.company-info-section {
		    display: flex;
		    justify-content: space-between;
		    align-items: flex-start;
		    margin-top: 50px;
		}
		
		.company-info,
		.developer-info {
		    flex: 1;
		    padding: 0 20px;
		}
		
		.company-info h2,
		.developer-info h2 {
		    font-size: 1.8em;
		    margin-bottom: 20px;
		}
		
		.company-info p,
		.developer-info p {
		    font-size: 1.1em;
		    line-height: 1.6;
		    margin-bottom: 15px;
		}
		
		.social-links {
		    margin-top: 15px;
		}
		
		.social-links a {
		    display: inline-block;
		    margin-right: 10px;
		    font-size: 1.1em;
		    color: #007bff; 
		    text-decoration: none;
		}
		
		.social-links a:hover {
		    text-decoration: underline;
		}
    </style>
    
</head>
<body>
    <%@ include file="template/headerMain.jsp" %>
    <main>
        <section class="welcome-section">
		    <div class="welcome-content">
		        <h1>Bienvenido a Gojos Stores</h1>
		        <p>Gojos es tu tienda de fitness de confianza. Ofrecemos productos de alta calidad para ayudarte a alcanzar tus metas de salud y bienestar.</p>
		        <p>Explora nuestra amplia gama de suplementos, equipos de entrenamiento y accesorios para un estilo de vida saludable.</p>
		        <p>¡Comienza tu viaje hacia un mejor tú con Gojos!</p>
		    </div>
		    <div class="image-container">
		        <img src="${pageContext.request.contextPath}/images/image1.jpg" alt="Fitness Image">
		    </div>
		</section>

	<section class="company-info-section">
	    <div class="company-info">
	        <h2>Datos de la Empresa</h2>
	        <p>Gojos Stores es una tienda de fitness comprometida con ofrecer productos de alta calidad para mejorar la salud y el bienestar de nuestros clientes.</p>
	        <p>Nuestro objetivo es proporcionar una experiencia de compra excepcional y ayudar a cada persona a alcanzar sus metas de acondicionamiento físico.</p>
	        <p>¡Únete a la comunidad de Gojos y haz que cada día cuente para tu bienestar!</p>
	    </div>
	    <div class="developer-info">
	        <h2>Desarrolladores</h2>
	        <p>Este proyecto fue desarrollado por Andrés Guaman.</p>
	        <div class="social-links">
	            <a href="https://www.linkedin.com/in/andrés-guamán-957320311" target="_blank">Linkedin</a>
	            <a href="https://github.com/landr3s" target="_blank">GitHub</a>
	        </div>
	    </div>
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
</body>
</html>
