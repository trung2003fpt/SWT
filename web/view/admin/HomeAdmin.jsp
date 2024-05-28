<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Admin</title>
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
    <body>
        <!--Header Admin-->
        <%@include file="HeaderAdmin.jsp"%>
        <!--Sidebar Menu Admin-->
        <%@include file="SidebarMenu.jsp"%>
        <!--Data Statistical Admin-->
        <main class="app-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="app-title">
                        <ul class="app-breadcrumb breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#"><b></b></a>
                            </li>
                        </ul>
                        <div id="clock"></div>
                    </div>
                </div>
            </div>
            <div class="row">
                <!--Left-->
                <div class="col-md-12 col-lg-6">
                    <div class="row">
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small primary coloured-icon">
                                <i class="icon bx bxs-user-account fa-3x"></i>

                            </div>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small info coloured-icon">
                                <i class="icon bx bxs-data fa-3x"></i>

                            </div>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small warning coloured-icon">
                                <i class="icon bx bxs-shopping-bags fa-3x"></i>

                            </div>
                        </div>
                        <!-- col-6 -->
                        <div class="col-md-6">
                            <div class="widget-small danger coloured-icon">
                                <i class="icon bx bxs-error-alt fa-3x"></i>

                            </div>
                        </div>
                        <!-- col-12 -->
                        <div class="col-md-12">
                            <div class="tile">
                                
                                <!-- / div trống-->
                            </div>
                        </div>
                        <!-- / col-12 -->
                        <!-- col-12 -->
                        <div class="col-md-12">
                            <div class="tile">
                                
                            </div>
                        </div>
                        <!-- / col-12 -->
                    </div>
                </div>
                <!--END left-->
                <!--Right-->
                <div class="col-md-12 col-lg-6">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="tile">
                                <h3 class="tile-title"></h3>
                                <div class="embed-responsive embed-responsive-16by9">
                                    <canvas
                                        class="embed-responsive-item"
                                        id="lineChartDemo"
                                        ></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="tile">
                                <h3 class="tile-title"></h3>
                                <div class="embed-responsive embed-responsive-16by9">
                                    <canvas
                                        class="embed-responsive-item"
                                        id="barChartDemo"
                                        ></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--END right-->
            </div>
            <!--Footer Admin-->
            <%@include file="FooterAdmin.jsp"%>
        </main>
    </body>
</html>
