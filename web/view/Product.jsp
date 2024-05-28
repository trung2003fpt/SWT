<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/product.css" />
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
        <!--Product-->
        <div class="container fruite py-5">
            <div class="row g-4">
                <div class="col-lg-9">
                    <div class="row g-4 justify-content-center">

                        <%
                        List<Products> pProduct = (List<Products>) request.getAttribute("product");
                        if (pProduct != null && !pProduct.isEmpty()) {
                        for (Products p : pProduct) {
                        %>

                        <div class="col-md-6 col-lg-6 col-xl-4">
                            <div class="rounded position-relative fruite-item">
                                <div class="fruite-img">
                                    <a href="${pageContext.request.contextPath}/detailproduct?product=<%= p.getIdP()%>&cid=<%= p.getIdC().getIdC()%>">
                                        <img 
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
                                    <div
                                        class="d-flex justify-content-between flex-lg-wrap"
                                        >
                                        <p class="text-dark fs-5 fw-bold mb-0">Giá:<%= p.getPriceP()%> VND</p>
                                        <a
                                            href="${pageContext.request.contextPath}/detailproduct?product=<%= p.getIdP()%>&cid=<%= p.getIdC().getIdC()%>"
                                            class="btn border border-secondary rounded-pill px-3 text-primary"
                                            >
                                            Chi tiết</a
                                        >
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
    </body>
</html>
