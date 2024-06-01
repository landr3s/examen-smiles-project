<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="${pageContext.request.contextPath}/client/clientHome.jsp">Inicio</a></li>
                <li><a href="${pageContext.request.contextPath}/client/clientProducts.jsp">Productos</a></li>
            </ul>
        </nav>
        <form action="${pageContext.request.contextPath}/login.jsp">
            <input type="submit" value="Sign Out">
        </form>
    </header>
</body>
</html>
