<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/styles.css">
    <style>

        header nav ul li:first-child {
            margin-right: auto;
        }

        header nav ul li:last-child {
            margin-left: auto;
        }

        header img {
            width: 50px; /* Ajusta el tamaño del logo según sea necesario */
            height: auto; /* Para mantener la proporción */
        }
    </style>
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo"></li>
                <li><a href="${pageContext.request.contextPath}/index.jsp">Inicio</a></li>
                <li><a href="${pageContext.request.contextPath}/login.jsp">Sign In</a></li>
            </ul>
        </nav>
    </header>
</body>
</html>
