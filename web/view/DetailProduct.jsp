<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/detailproduct.css" />
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
        <!--Heade Home-->
        <%@include file="HeaderHome.jsp"%>
        <!--Title-->
        <div class="container-fluid page-header py-5">
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/default">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="">Chi tiết sản phẩm</a></li>
            </ol>
        </div>

        <section class="py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="row gx-4 gx-lg-5 align-items-center">

                    <%
                        List<Products> pDetailProduct = (List<Products>) request.getAttribute("detailProduct");
                        if (pDetailProduct != null && !pDetailProduct.isEmpty()) {
                        for (Products p : pDetailProduct) {
                    %>

                    <div class="col-md-6">
                        <img id= "img1" class="card-img-top mb-5 mb-md-0" src="<%= p.getImage()%>" />
                    </div>
                    <div class="col-md-6">
                        <h1 class="display-5 fw-bolder"><%= p.getNameP()%></h1>
                        <div class="fs-5 mb-5">
                            <span><%= p.getPriceP()%> VND</span>
                        </div>
                        <p class="lead"><%= p.getDescriptionP()%></p>
                        <form>
                            <div class="d-flex">
                                <!--                                <input class="form-control text-center me-3" id="inputQuantity" type="number" 
                                                                       value="1" name="quantity" style="max-width: 3rem" />-->
                                <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> Thêm vào giỏ hàng
                                </button>
                            </div>
                        </form>
                    </div>

                    <%
                         }
                     }
                    %>

                </div>
            </div>
        </section>

        <section class="py-5 bg-light">
            <div class="container px-4 px-lg-5 mt-5">
                <h2 class="fw-bolder mb-4">Sản phẩm tương tự</h2>
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <%
                        List<Products> pDetailSameProduct = (List<Products>) request.getAttribute("sameProduct");
                        if (pDetailSameProduct != null && !pDetailSameProduct.isEmpty()) {
                        for (Products p : pDetailSameProduct) {
                    %>

                    <div class="col mb-5">
                        <div class="card h-100">
                            <a id= "img2" href="${pageContext.request.contextPath}/detailproduct?product=<%= p.getIdP()%>&cid=<%= p.getIdC().getIdC()%>">
                                <img
                                    class="card-img-top"
                                    src="<%= p.getImage()%>"
                                    />
                            </a> 
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder"><%= p.getNameP()%></h5>
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
        </section>
        <!--Footer-->
        <%@include file="Footer.jsp" %>
    </body>
</html>
