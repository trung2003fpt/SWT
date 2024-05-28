<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tree Shop</title>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/treeshop.css" />
    </head>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Arial", sans-serif;
        }
    </style>
    <body>
        <!--Header Home-->
        <%@include file="HeaderHome.jsp"%>
        <!--Slider-->
        <%@include file="Slider.jsp"%>
        <!--Product-->
        <%@include file="Product.jsp"%>
        <!--Footer-->
        <%@include file="Footer.jsp"%>
    </body>
</html>
