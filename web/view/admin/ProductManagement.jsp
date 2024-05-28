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
        <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css"
            />
        <!-- or -->
        <link
            rel="stylesheet"
            href="https://unpkg.com/boxicons@latest/css/boxicons.min.css"
            />
        <!-- Font-icon css-->
        <link
            rel="stylesheet"
            type="text/css"
            href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
            />
        <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css"
            />
    </head>
    <body onload="time()" class="app sidebar-mini rtl">
        <!--Header Admin-->
        <%@include file="HeaderAdmin.jsp"%>
        <!--Sidebar Menu-->
        <%@include file="SidebarMenu.jsp"%>
        <!--Management Product-->
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active">
                        <a href=""><b>Danh sách sản phẩm</b></a>
                    </li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-2">
                                    <a
                                        class="btn btn-add btn-sm"
                                        href="${pageContext.request.contextPath}/addproductadmin"
                                        title="Thêm"
                                        ><i class="fas fa-plus"></i> Tạo mới sản phẩm</a
                                    >
                                </div>
                            </div>
                                        
                            <%
                               if (request.getAttribute("AddP") != null ) {
                            %>
                            <p><%= request.getAttribute("AddP")%></p>
                            <%
                                }
                            %>
                            
                            <%
                           if (request.getAttribute("UpdateP") != null ) {
                            %>
                            <p><%= request.getAttribute("UpdateP")%></p>
                            <%
                                }
                            %>
                            
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>Mã sản phẩm</th>
                                        <th>Tên sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th>Giá tiền</th>
                                        <th>Ảnh</th>
                                        <th>Danh mục</th>
                                        <th>Mô tả</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                       List<Products> pAdmin = (List<Products>) request.getAttribute("pAdmin");
                                       if (pAdmin != null && !pAdmin.isEmpty()) {
                                       for (Products p : pAdmin) {
                                    %>
                                    <tr>
                                        <td><%= p.getIdP()%></td>
                                        <td><%= p.getNameP()%></td>
                                        <td><%= p.getQuantityP()%></td>
                                        <td><%= p.getPriceP()%></td>
                                        <td>
                                            <img
                                                src="<%= p.getImage()%>"
                                                alt=""
                                                width="100px;"
                                                />
                                        </td> 
                                        <td><%= p.getIdC().getNameC()%></td>
                                        <td><%= p.getDescriptionP()%></td>
                                        <td>
                                            <button
                                                class="btn btn-primary btn-sm trash"
                                                type="button"
                                                title="Xóa"
                                                onclick="doDelete('<%= p.getIdP()%>')"
                                                >
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                            <button
                                                class="btn btn-primary btn-sm edit"
                                                type="button"
                                                title="Sửa"
                                                id="show-emp"
                                                onclick="location.href = 'updateproductadmin?pid=<%= p.getIdP()%>'"
                                                >
                                                <i class="fas fa-edit"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <%
                                          }
                                            }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script>
            function doDelete(idP) {
                if (confirm("Bạn có muốn xóa sản phẩm không?")) {
                    window.location = "deleteproductadmin?pid=" + idP;
                }
            }
        </script>
    </body>
</html>
