<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/footer.css" />
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
    <body>
        <!-- Footer -->
        <div id="footer">
            <div class="container">
                <section id="section-footer" class="gradient-background">
                    <footer class="row py-3 mt-3">
                        <div class="col mb-3" id="block1">
                            <h5>GIỚI THIỆU CHUNG</h5>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2">
                                <li><a href="${pageContext.request.contextPath}/default">Trang chủ</a></li>
                                </li>
                                <li class="nav-item mb-2">
                                    <a href="${pageContext.request.contextPath}/view/Show.jsp" class="nav-link">Giới thiệu</a>
                                </li>
                                <li class="nav-item mb-2">
                                    <a href="#" class="nav-link">Thư viện hình ảnh</a>
                                </li>
                                <li class="nav-item mb-2">
                                    <a href="#" class="nav-link">Câu hỏi</a>
                                </li>
                            </ul>
                        </div>

                        <div class="col mb-3" id="block2">
                            <h5>THÔNG TIN LIÊN HỆ</h5>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2">
                                    <p><b>Địa chỉ:</b> Dũng Tiến, Thường Tín, Hà Nội</p>
                                </li>
                                <li class="nav-item mb-2">
                                    <p><b>Điện thoại:</b> 0363630653</p>
                                </li>
                                <li class="nav-item mb-2">
                                    <p><b>Email:</b> treeshop@gmail.com</p>
                                </li>
                                <li class="nav-item mb-2">
                                    <p><b>Website:</b> TreeShop.com</p>
                                </li>
                            </ul>
                        </div>

                        <div class="col mb-3">
                            <h5>CHÍNH SÁCH KHÁCH HÀNG</h5>
                            <ul class="nav flex-column">
                                <li class="nav-item mb-2">
                                    <a href="#" class="nav-link">Chính sách bảo mật</a>
                                </li>
                                <li class="nav-item mb-2">
                                    <a href="#" class="nav-link">Hướng dẫn thanh toán</a>
                                </li>
                                <li class="nav-item mb-2">
                                    <a href="#" class="nav-link">Điều kiện bảo hành, đổi trả</a>
                                </li>
                                <li class="nav-item mb-2">
                                    <a href="#" class="nav-link">Chính sách giới thiệu</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col mb-3">
                            <h5>MẠNG XÃ HỘI</h5>
                            <div id="icons">
                                <a href="https://www.facebook.com/nguyenduong.5007" class="facebook-icon"
                                   ><i class="fab fa-facebook"></i
                                    ></a>
                                <a href="https://mail.google.com/mail/u/0/#inbox" class="email-icon"
                                   ><i class="fas fa-envelope"></i
                                    ></a>
                                <a href="https://www.youtube.com/channel/UC0z3ExdZkurhdufbYqYt-1A" class="phone-icon"><i class="fas fa-phone"></i></a>
                            </div>
                            <p class="text-body-secondary">© 2024 Harley</p>
                        </div>
                    </footer>
                </section>
            </div>
        </div>
    </body>
</html>
