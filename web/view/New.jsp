<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/new.css" />
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
</head>
<body>
    <!--Heade Home-->
    <%@include file="HeaderHome.jsp" %>
    <!--Banner-->
    <div class="container-fluid page-header py-5">
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/default">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="">Tin tức</a></li>
        </ol>
    </div>
    <!--Tin tưc-->
    <div class="outer-container">
        <div class="container_new">
            <ul class="item-list">
                <li>
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/image/cayhopphongthuy.png" alt="alt" />
                        <div class="text-content">
                            <h3>Trồng Cây gì hợp Mệnh để gặp nhiều may mắn?</h3>
                            <p>Trong dịp đầu năm mới, ngoài việc dọn dẹp nhà cửa, phòng làm việc để...</p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/image/show1.jpg" alt="alt" />
                        <div class="text-content">
                            <h3>Tiêu chí chọn cây cảnh văn phòng thích hợp</h3>
                            <p>Các tiêu chí giúp lựa chọn cây cảnh văn phòng thích hợp Nhịp sống náo...</p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/image/5caycanhmini.png" alt="alt" />
                        <div class="text-content">
                            <h3>Top 5 cây cảnh mini để bàn HOT nhất năm 2018</h3>
                            <p>Cây cảnh mini để bàn được ưa chuộng Cây cảnh mini để bàn đang là...</p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/image/congdungcaykimngan.png" alt="alt" />
                        <div class="text-content">
                            <h3>Những công dụng của cây Kim Ngân trong cuộc sống</h3>
                            <p>Tìm hiểu ý nghĩa, công dụng của cây Kim Ngân Đối với nhiều người Việt...</p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <img src="${pageContext.request.contextPath}/image/cachchongcaykimngan.png" alt="alt" />
                        <div class="text-content">
                            <h3>Cách trồng cây kim ngân để bàn đúng cách</h3>
                            <p>Kim ngân là một trong những cây cảnh có nhiều tác dụng tuyệt vời đối...</p>
                        </div>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <!--Footer-->
    <%@include file="Footer.jsp" %>
</body>
</html>
