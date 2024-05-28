<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" />
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css" />
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css" />
    </head>
    <body onload="time()" class="app sidebar-mini rtl">
        <!--Header Admin-->
        <%@include file="HeaderAdmin.jsp"%>
        <!--Sidebar Menu-->
        <%@include file="SidebarMenu.jsp"%>
        <!--Update Prodcut-->
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group col-md-12">
                            <span class="thong-tin-thanh-toan">
                                <h5>Chỉnh sửa thông tin sản phẩm</h5>
                            </span>
                        </div>
                    </div>
                    <form method="post" action="updateproductadmin">
                        <div class="row">
                            <%
                            List<Products> pUp = (List<Products>) request.getAttribute("productUp");
                            if (pUp != null && !pUp.isEmpty()) {
                            for (Products p : pUp) {
                            %>
                            <div class="form-group col-md-6">
                                <label class="control-label">Tên sản phẩm</label>
                                <input class="form-control" type="text" required value="<%=p.getNameP()%>" name="nameP"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Số lượng</label>
                                <input class="form-control" type="number" required min="0" value="<%=p.getQuantityP()%>" name="quantityP"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label class="control-label">Giá bán</label>
                                <input class="form-control" type="number"required min="0" value="<%=p.getPriceP()%>" name="priceP"/>
                            </div>
                            <div class="form-group col-md-12">
                                <label class="control-label">Đường dẫn hình ảnh sản phẩm</label>
                                <!--<img src="${pageContext.request.contextPath}/<%=p.getImage()%>" style="width: 100px; height: 100px"/>-->
                                <input class="form-control" type="text" required value="<%=p.getImage()%>" name="imageP" />
                            </div>
                            <div class="form-group col-md-12">
                                <label class="control-label">Mô tả sản phẩm</label>
                                <input class="form-control1" type="text" required 
                                       value="<%=p.getDescriptionP()%>" name="descriptionP"/>
                            </div>
                            <%
                                }
                                  }
                            %>
                            <div class="form-group col-md-6">
                                <label for="exampleSelect1" class="control-label">Danh mục sản phẩm</label>
                                <select class="form-control" id="exampleSelect1" name="idC">
                                    <%
                                   List<Categories> cUp = (List<Categories>) request.getAttribute("categoriesUp");
                                    if (cUp != null && !cUp.isEmpty()) {
                                    for (Categories c : cUp) {
                                    %>
                                    <option value="<%=c.getIdC()%>"><%=c.getNameC()%></option>
                                    <%
                                       }
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <br />
                        <input class="btn btn-save" type="submit" value="Cập nhật sản phẩm" style="margin-left: 8px;margin-right: 20px"/>
                        <a class="btn btn-cancel" data-dismiss="modal" href="${pageContext.request.contextPath}/productmanagement">Hủy bỏ</a>
                        <br />
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
