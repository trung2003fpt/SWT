<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/headerhome.css" />
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
    <body>
        <!--khung ngang -->
        <div>
            <div class="container">
                <div id="header">
                    <!-- logo -->
                    <div id="element_left">
                        <img src="${pageContext.request.contextPath}/image/logo.png" alt="Tree Shop" />
                        <div id="text"><h1>Tree Shop</h1></div>
                    </div>
                    <!-- tìm kiếm -->
                    <div id="element_mid">
                        <form action="${pageContext.request.contextPath}/search">
                            <input type="search" name= "nameProduct" placeholder="Nhập tên sản phẩm..."/>
                            <button type="submit">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </form>
                    </div>

                    <!-- User, Đăng xuất -->
                    <div id="element_right">
                        <%
                              HttpSession httpSession = request.getSession();
                              String nameA = (String) httpSession.getAttribute("name");
                              if (nameA != null && !nameA.isEmpty()) {
                              Integer role = (Integer) httpSession.getAttribute("role");
                        %> 
                        <%
                        if (role != null && role == 0) {
                        %>
                        <!--Admin-->
                        <button type="button" class="" onclick="location.href = '${pageContext.request.contextPath}/homeadmin'">
                            <%= nameA %>
                            <i class="fa-solid fa-user"></i>
                        </button>
                        <%
                           } else {
                        %>
                        <!--user-->
                        <button type="button" onclick="location.href = '${pageContext.request.contextPath}/profile'">
                            <%= nameA %>
                            <i class="fa-solid fa-user"></i>
                        </button>
                        <%
                        }
                        %>   
                        <button type="button" class="logout" onclick="location.href = '${pageContext.request.contextPath}/logout'">
                            Đăng xuất
                            <i class="fa-solid fa-right-from-bracket"></i>
                        </button>
                        <%
                       } else {
                        %>
                        <!-- Đăng nhập, Đăng ký -->
                        <button type="button" class="login" onclick="location.href = '${pageContext.request.contextPath}/login'">
                            Đăng nhập
                            <i class="fa-solid fa-right-to-bracket"></i>
                        </button>
                        <button type="button" class="sign_up" onclick="location.href = '${pageContext.request.contextPath}/signup'">
                            Đăng ký
                            <i class="fa-solid fa-user-plus"></i>
                        </button>
                        <%
                        }
                        %>
                        <!--Giỏ hàng-->
                        <button type="button" onclick="location.href = '#'">
                            Giỏ hàng
                            <i class="fa-solid fa-cart-shopping"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div> 
        <!-- Thanh menu -->
        <div id="background_menu">
            <div class="container">
                <div id="menu">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/default">Trang chủ</a></li>
                        <li><a href="${pageContext.request.contextPath}/show">Giới thiệu</a></li>
                        <li>                
                            <a href="${pageContext.request.contextPath}/category">
                                Danh mục sản phẩm <i class="fa-solid fa-angle-down"></i>
                            </a>
                            <ul>

                                <%
                                     List<Categories> cHeader = (List<Categories>) request.getAttribute("categories");
                                    if (cHeader != null && !cHeader.isEmpty()) {
                                            for (Categories c : cHeader) {
                                %>

                                <li><a href="${pageContext.request.contextPath}/subcategory?cid=<%= c.getIdC()%>"><%= c.getNameC()%></a></li>

                                <%
                                             }
                                       }
                                %>

                            </ul>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/new">Tin tức</a></li>
                        <li><a href="${pageContext.request.contextPath}/contact">Liên hệ</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>
