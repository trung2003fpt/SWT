<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.*"%>
<%@page  import="model.*"%>
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
    <body  onload="time()" class="app sidebar-mini rtl">
        <!--Header Admin-->
        <%@include file="HeaderAdmin.jsp"%>
        <!--Sidebar Menu Admin-->
        <%@include file="SidebarMenu.jsp"%>
        <!--Order-->
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active">
                        <a href=""><b>Danh sách thông tin liên hệ của khách hàng</b></a>
                    </li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                            </div>
                            <table class="table table-hover table-bordered" id="sampleTable">
                                <thead>
                                    <tr>
                                        <th>ID Khách hàng</th>
                                        <th>Họ và Tên</th>
                                        <th>Email</th>
                                        <th>Số điện thoại</th>
                                        <th>Lời nhắn</th>
                                        <th>Chức năng</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                  List<Contact> contacts = (List<Contact>)  request.getAttribute("contact");
                                  if (contacts != null && !contacts.isEmpty()) {
                                  for (Contact c : contacts) {
                                    %>
                                    <tr>
                                        <td><%= c.getIdCO()%></td>
                                        <td><%= c.getFullNameCO()%></td>
                                        <td><%= c.getEmailAddressCO()%></td>
                                        <td><%= c.getPhoneNumberCO()%></td>
                                        <td><%= c.getMessageCO()%></td>
                                        <td>
                                            <button
                                                class="btn btn-primary btn-sm trash"
                                                type="button"
                                                title="Xóa"
                                                onclick="location.href = 'deletecontactadmin?idCO=<%= c.getIdCO()%>'"
                                                >
                                                <i class="fas fa-trash-alt"></i>
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
    </body>
</html>
