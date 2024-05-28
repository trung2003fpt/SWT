<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/signup.css" />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
            />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
    </head>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Arial", sans-serif;
        }
    </style>
    <body>
        <!-- Header -->
        <div id="header_logo">
            <img src="${pageContext.request.contextPath}/image/logo.png" alt="Logo Tree Shop" />
            <h2>Tree Shop</h2>
            <button onclick="location.href = '${pageContext.request.contextPath}/default'">
                <i class="fa-solid fa-rotate-left"></i>
            </button>
        </div>
        <!-- Sign up -->
        <div class="login-box">
            <h2>Đăng Ký</h2>
 
            <%  
                     HttpSession httpSession = request.getSession();
                     String err = (String) httpSession.getAttribute("err");
                      if (err != null && !err.isEmpty()) {
            %>
            <p> <%= err%> </p>
            <%
            }
            %>
            
            <form action="${pageContext.request.contextPath}/signup" method="post">

                <div class="user-box">
                    <input type="email" name="email" required />
                    <label>Email</label>
                </div>
                <div class="user-box">
                    <input type="text" name="name" required />
                    <label>Tên Tài Khoản</label>
                </div>
                <div class="user-box">
                    <input type="password" name="pass" required />
                    <label>Mật Khẩu</label>
                </div>
                <div class="user-box">
                    <input type="password" name="confirmPass" required />
                    <label>Xác Nhận Mật Khẩu</label>
                </div>
                <input type="submit" value="Đăng ký" />
            </form>
        </div>
        <!-- Footer -->
        <%@include file="Footer2.jsp" %>
    </body>
</html>
