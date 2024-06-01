<!-- WebContent/register.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuario</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <%@ include file="template/headerMain.jsp" %>
    <main>
        <section>
            <h2>Registrar Nuevo Usuario</h2>
            <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
                <label for="username">Nombre de Usuario:</label>
                <input type="text" id="username" name="username" required>
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
                <button type="submit">Registrar</button>
            </form>
            <c:if test="${not empty successMessage}">
                <p style="color:green">${successMessage}</p>
            </c:if>
            <c:if test="${not empty errorMessage}">
                <p style="color:red">${errorMessage}</p>
            </c:if>
        </section>
    </main>
    <%@ include file="template/footer.jsp" %>
</body>
</html>
