<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/css/show.css" />
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
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Arial", sans-serif;
        }
    </style>
    <body>
        <!--Heade Home-->
        <%@include file="HeaderHome.jsp" %>
        <!--Banner-->
        <div class="container-fluid page-header py-5">
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/default">Trang chủ</a></li>
                <li class="breadcrumb-item"><a href="">Giới thiệu</a></li>
            </ol>
        </div>
        <!-- Giới Thiệu -->
        <div class="container" id="show">
            <h1>Giới Thiệu</h1>
            <p>
                Chào mừng đến với Tree Shop - Nơi đắm chìm trong thế giới tuyệt vời của
                cây cảnh! <br />
                🌿 Về chúng tôi: <br />Chúng tôi là đội ngũ đam mê cây cảnh, cam kết
                mang đến cho khách hàng những trải nghiệm mua sắm độc đáo và thú vị. Tại
                Tree Shop, chúng tôi tự hào cung cấp những loại cây cảnh đa dạng, từ cây
                xanh ngoại thất cho vườn nhà đến cây mini nội thất tinh tế.
                <br />
                🌱 Sản phẩm đa dạng: <br />Chúng tôi có một bộ sưu tập độc đáo của các
                loại cây cảnh phong phú, từ cây phát tài may mắn đến những cây bonsai
                tinh tế. Bạn có thể dễ dàng tìm thấy cây phù hợp với không gian của bạn
                và tạo nên điểm nhấn tuyệt vời.
                <br />
                <img src="${pageContext.request.contextPath}/image/show1.jpg" />
                <br />
                🌺 Chất lượng hàng đầu: <br />Chúng tôi cam kết cung cấp các sản phẩm
                chất lượng cao, đảm bảo sức khỏe và sự phát triển của cây cảnh. Mỗi cây
                được chọn lựa kỹ lưỡng để đảm bảo rằng chúng đáp ứng được tiêu chuẩn cao
                nhất về hình thức và sức khỏe.
                <br />
                🌍 Giao hàng toàn quốc: <br />Dù bạn ở đâu trong cả nước, chúng tôi cam
                kết mang đến dịch vụ giao hàng nhanh chóng và đáng tin cậy. Bạn chỉ cần
                lựa chọn sản phẩm yêu thích, và chúng tôi sẽ gửi nó trực tiếp đến cửa
                nhà của bạn.
                <br />
                🌟 Đội ngũ hỗ trợ chuyên nghiệp: <br />Nếu bạn có bất kỳ câu hỏi nào
                hoặc cần sự tư vấn, đội ngũ hỗ trợ của chúng tôi luôn sẵn lòng giúp đỡ.
                Chúng tôi tin rằng mỗi cây cảnh không chỉ là một sản phẩm mà còn là một
                trải nghiệm, và chúng tôi muốn đồng hành cùng bạn trong hành trình làm
                đẹp không gian sống.
                <br />
                Hãy ghé thăm Tree Shop ngay hôm nay và khám phá thế giới đầy màu sắc của
                cây cảnh! 🌿✨
            </p>
        </div>
        <!-- Footer -->
        <%@include file="Footer.jsp" %>
    </body>
</html>
