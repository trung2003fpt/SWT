<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/category.css" />
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
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Arial", sans-serif;
        }
    </style>
    <body>
        <!--Heade Home-->
        <%@include file="HeaderHome.jsp"%>
        <!--Title-->
        <div class="container-fluid page-header py-5">
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/default">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="">Danh mục sản phẩm</a></li>
            </ol>
        </div>
        <!--Product-->
        <div class="container fruite py-4">
            <div class="row g-4">
                <div class="col-lg-3">
                    <div class="row g-4">
                        <div class="col-lg-8">
                            <div class="mb-3">
                                <h4>Danh mục</h4>
                                <ul class="list-unstyled fruite-categorie">         

                                    <%
                                     List<Categories> cCategory = (List<Categories>) request.getAttribute("categories");
                                    if (cCategory != null && !cCategory.isEmpty()) {
                                            for (Categories c : cCategory) {
                                    %>

                                    <li>
                                        <div
                                            class="d-flex justify-content-between fruite-name"
                                            >
                                            <a href="${pageContext.request.contextPath}/subcategory?cid=<%= c.getIdC()%>">
                                                <i class="fas fa-tree"></i><%= c.getNameC()%>
                                            </a>
                                        </div>
                                    </li> 

                                    <%
                                         }
                                   }
                                    %>    

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="row g-4 justify-content-center">

                        <%
                        List<Products> pCategory = (List<Products>) request.getAttribute("product");
                        if (pCategory != null && !pCategory.isEmpty()) {
                        for (Products p : pCategory) {
                        %>

                        <div class="col-md-6 col-lg-6 col-xl-4">
                            <div class="rounded position-relative fruite-item">
                                <div class="fruite-img">
                                    <a><img
                                            src="<%= p.getImage()%>"
                                            class="img-fluid w-100 rounded-top"
                                            alt="Cây cảnh"
                                            />
                                    </a>
                                </div>
                                <div
                                    class="p-4 border border-secondary border-top-0 rounded-bottom"
                                    >
                                    <h4><%= p.getNameP()%></h4>
                                    <p>
                                        <%= p.getDescriptionP()%>
                                    </p>
                                    <div
                                        class="d-flex justify-content-between flex-lg-wrap"
                                        >
                                        <p class="text-dark fs-5 fw-bold mb-0">Giá: <%= p.getPriceP()%> VND</p>
                                        <a
                                            href="#"
                                            class="btn border border-secondary rounded-pill px-3 text-primary"
                                            ><i class="fa fa-shopping-bag me-2 text-primary"></i>
                                            Thêm vào giỏ hàng</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%
                            }
                        }
                        %>

                    </div>
                </div>
            </div>
        </div>
        <!--Footer-->
        <%@include file="Footer.jsp" %>
    </body>
</html>
