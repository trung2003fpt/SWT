<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Navbar-->
        <header class="app-header">
            <!-- Navbar Right Menu-->
            <ul class="app-nav">
                <!-- User Menu-->
                <li>
                    <a class="app-nav__item" href="${pageContext.request.contextPath}/logout"
                       ><i class="bx bx-log-out bx-rotate-180"></i>
                    </a>
                </li>
            </ul>
        </header>
    </body>
</html>
