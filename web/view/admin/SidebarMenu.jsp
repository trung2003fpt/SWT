<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Sidebar menu-->
        <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
        <aside class="app-sidebar">
            <div class="app-sidebar__user">
                <img
                    class="app-sidebar__user-avatar"
                    src="${pageContext.request.contextPath}/image/gautruc.jpg"
                    width="50px"
                    alt="User Image"
                    />
                <div>
                    <%
                    HttpSession httpSession = request.getSession(false);
                       if (httpSession != null && httpSession.getAttribute("name") != null) {
                    %>
                    <p class="app-sidebar__user-name"><b><%= httpSession.getAttribute("name") %></b></p>
                            <%
                                }
                            %>
                    <p class="app-sidebar__user-designation">Admin</p>
                </div>
            </div>
            <hr />
            <ul class="app-menu">
                <li>
                    <a class="app-menu__item haha" href="${pageContext.request.contextPath}/default"
                       ><i class="app-menu__icon bx bx-cart-alt"></i>
                        <span class="app-menu__label">Trang chủ bán hàng</span></a
                    >
                </li>
                <li>
                    <a class="app-menu__item active" href="${pageContext.request.contextPath}/homeadmin"
                       ><i class="app-menu__icon bx bx-tachometer"></i
                        ><span class="app-menu__label">Trang chủ Admin</span></a
                    >
                </li>
                <li>
                    <a class="app-menu__item" href="${pageContext.request.contextPath}/productmanagement"
                       ><i class="app-menu__icon bx bx-purchase-tag-alt"></i
                        ><span class="app-menu__label">Quản lý sản phẩm</span></a
                    >
                </li>
                <li>
                    <a class="app-menu__item" href="${pageContext.request.contextPath}/ordermanagement"
                       ><i class="app-menu__icon bx bx-task"></i
                        ><span class="app-menu__label">Quản lý đơn hàng</span></a
                    >
                </li>
                <li>
                    <a class="app-menu__item" href="${pageContext.request.contextPath}/contactadmin"
                       ><i class="app-menu__icon bx bx-pie-chart-alt-2"></i
                        ><span class="app-menu__label">Liên hệ của khách hàng</span></a
                    >
                </li>
            </ul>
        </aside>
    </body>
</html>
