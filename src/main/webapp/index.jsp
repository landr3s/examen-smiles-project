<!-- WebContent/index.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gojos - Inicio</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
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
    </main>
    <%@ include file="template/footer.jsp" %>
</body>
</html>
