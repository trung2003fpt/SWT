<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="model.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .Choicefile {
                display: block;
                background: #14142B;
                border: 1px solid #fff;
                color: #fff;
                width: 150px;
                text-align: center;
                text-decoration: none;
                cursor: pointer;
                padding: 5px 0px;
                border-radius: 5px;
                font-weight: 500;
                align-items: center;
                justify-content: center;
            }

            .Choicefile:hover {
                text-decoration: none;
                color: white;
            }

            #uploadfile,
            .removeimg {
                display: none;
            }

            #thumbbox {
                position: relative;
                width: 100%;
                margin-bottom: 20px;
            }

            .removeimg {
                height: 25px;
                position: absolute;
                background-repeat: no-repeat;
                top: 5px;
                left: 5px;
                background-size: 25px;
                width: 25px;
                /* border: 3px solid red; */
                border-radius: 50%;

            }

            .removeimg::before {
                -webkit-box-sizing: border-box;
                box-sizing: border-box;
                content: '';
                border: 1px solid red;
                background: red;
                text-align: center;
                display: block;
                margin-top: 11px;
                transform: rotate(45deg);
            }

            .removeimg::after {
                /* color: #FFF; */
                /* background-color: #DC403B; */
                content: '';
                background: red;
                border: 1px solid red;
                text-align: center;
                display: block;
                transform: rotate(-45deg);
                margin-top: -2px;
            }
        </style>
    </head>
    <body class="app sidebar-mini rtl">
        <!--Header Admin-->
        <%@include file="HeaderAdmin.jsp"%>
        <!--Sidebar Menu Admin-->
        <%@include file="SidebarMenu.jsp"%>
        <!--Add Prodcut Admin-->
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/productmanagement">Danh sách sản phẩm</a></li>
                    <li class="breadcrumb-item">Thêm sản phẩm</li>
                </ul>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <h3 class="tile-title">Tạo mới sản phẩm</h3>
                        <div class="tile-body">
                            <div class="row element-button">
                            </div>
                            <form class="row" action="addproductadmin" method="post">
                                <div class="form-group col-md-3">
                                    <label class="control-label">Tên sản phẩm</label>
                                    <input class="form-control" type="text" name="nameP" required>
                                </div>
                                <div class="form-group  col-md-3">
                                    <label class="control-label">Số lượng sản phẩm</label>
                                    <input class="form-control" type="number" name="quantityP" min="0" max="999" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Giá bán sản phẩm</label>
                                    <input class="form-control" type="number" name="priceP" min="0" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">Đường dẫn hình ảnh sản phẩm</label>
                                    <input class="form-control" type="file" name="imageP" required>
                                </div> 
                                <div class="form-group col-md-3">
                                    <label for="exampleSelect1" class="control-label">Danh mục sản phẩm</label>          
                                    <select class="form-control" id="exampleSelect1" name="idC">
                                        <%
                                        List<Categories> cAdd = (List<Categories>) request.getAttribute("categories");
                                        if (cAdd != null && !cAdd.isEmpty()) {
                                        for (Categories c : cAdd) {
                                        %>  
                                        <option value="<%= c.getIdC()%>"> <%= c.getNameC()%></option>
                                        <%
                                           }
                                         }          
                                        %>
                                    </select>
                                </div>
                                <div class="form-group col-md-12">
                                    <label class="control-label">Mô tả sản phẩm</label>
                                    <textarea class="form-control" name="descriptionP" id="mota" required></textarea>
                                </div>
                                <button class="btn btn-save" type="submit" style="margin-left: 15px;margin-right: 20px">Thêm sản phẩm</button>
                                <a class="btn btn-cancel" href="${pageContext.request.contextPath}/productmanagement">Hủy bỏ</a>
                            </form> 
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>

