<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/contact.css" />
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
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: "Arial", sans-serif;
            }
        </style>
    </head>
    <body>
        <!--Heade Home-->
        <%@include file="HeaderHome.jsp" %>
        <!--Banner-->
        <div class="container-fluid page-header py-5">
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/default">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="">Liên hệ</a></li>
            </ol>
        </div>
        <!--Contact-->
        <div class="page-wrapper page-right-sidebar">
            <div class="row">
                <div id="content" class="large-9 left col col-divided" role="main">
                    <div class="page-inner">
                        <div class="row" id="row-1609336833">
                            <div id="col-1109234639" class="col medium-6 small-12 large-6">
                                <div class="col-inner">
                                    <h4>Công ty Cổ Phần Cây xanh FPT</h4>
                                    <p>
                                        <strong>FPT Group</strong> cam kết phát triển một hệ sinh thái doanh nghiệp toàn diện,
                                        bao gồm <em>Nguyên liệu, Sản xuất, Phân phối, Xuất khẩu</em>, làm đầu ngành tại Việt Nam.
                                        Chúng tôi không chỉ xây dựng cơ sở hạ tầng mạnh mẽ mà còn hướng tới sự phát triển bền vững,
                                        đồng hành cùng sự nghiệp phồn thịnh của đất nước.
                                    </p>
                                    <p>
                                        Với tầm nhìn chiến lược, FPT là biểu tượng niềm tin và tự hào của Việt Nam.
                                        Chúng tôi khẳng định vị thế của mình như một "cánh chim đầu đàn", đưa nền nông nghiệp
                                        Việt Nam và đất nước vươn tầm quốc tế.
                                    </p>
                                    <h3>Tree Shop</h3>
                                    <ul>
                                        <li>
                                            <strong>Địa chỉ:</strong> Dũng Tiến, Thường Tín, Hà Nội
                                        </li>
                                        <li><strong>Hotline:</strong> 0363630653</li>
                                        <li>
                                            <strong>Email:</strong> treeshop@gmail.com
                                        </li>
                                        <li><strong>Giờ làm việc:</strong> 10:00am – 17:00pm</li>
                                    </ul>
                                </div>
                            </div>
                            <div id="col-611678908" class="col medium-6 small-12 large-6">
                                <div class="col-inner">
                                    <div
                                        role="form"
                                        class="wpcf7"
                                        id="wpcf7-f830-p120-o1"
                                        lang="vi"
                                        dir="ltr"
                                        >
                                        <div class="screen-reader-response">
                                            <p
                                                role="status"
                                                aria-live="polite"
                                                aria-atomic="true"
                                                ></p>
                                            <ul></ul>
                                        </div>

                                        <div class="form-lien-he">
                                            <h3>Để lại lời nhắn cho chúng tôi</h3>
                                            <%
                                             if(request.getAttribute("mess") != null) {
                                            %>
                                            <p> <%= request.getAttribute("mess")%> </p>
                                            <%
                                                } else {
                                            %>
                                            <p class="des">
                                                Vui lòng để lại thông tin.
                                            </p>
                                            <%
                                                }
                                            %>
                                            <form action="contact" method="post" class="wpcf7-form init" novalidate="novalidate" data-status="init">
                                                <p>
                                                    <label>Họ và tên</label><br />
                                                    <span class="wpcf7-form-control-wrap text-783">
                                                        <input type="text" name="name" size="40"  />
                                                    </span><br />
                                                    <label>Email</label><br />
                                                    <span class="wpcf7-form-control-wrap email-328">
                                                        <input type="email" name="email" size="40"  />
                                                    </span><br />
                                                    <label>Số điện thoại</label><br />
                                                    <span class="wpcf7-form-control-wrap tel-822">
                                                        <input type="tel" name="phoneNumber" size="40" />
                                                    </span><br />
                                                    <label>Lời nhắn</label><br />
                                                    <span class="wpcf7-form-control-wrap tel-822">
                                                        <input type="text" name="message" size="40"  />
                                                    </span><br />
                                                    <input type="submit" value="Gửi liên hệ" class="wpcf7-form-control wpcf7-submit" />
                                                </p>
                                            </form>
                                        </div>         
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p>
                            <iframe
                                style="border: 0"
                                src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1907320.9588685273!2d105.842203!3d20.983165!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x5ba35929e893db27!2zQ8O0bmcgVHkgQ-G7lSBQaOG6p24gRMaw4bujYyBQaOG6qW0gVmluYXBoYXJtYSAtIEdyb3Vw!5e0!3m2!1sen!2sus!4v1624498063085!5m2!1sen!2sus"
                                width="100%"
                                height="250"
                                allowfullscreen="allowfullscreen"
                                ></iframe>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!--Footer-->
        <%@include file="Footer.jsp" %>
    </body>
</html>
