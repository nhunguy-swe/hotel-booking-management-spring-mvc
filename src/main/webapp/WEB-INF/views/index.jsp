<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Quản Lý Khách Sạn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="p-5 mb-5 bg-white rounded-3 shadow-sm border text-center">
    <h1 class="display-5 fw-bold text-dark text-uppercase">
        <i class="bi bi-building-fill text-warning"></i> Hệ Thống Quản Lý Khách Sạn
    </h1>
    <p class="lead text-muted mt-3">Chào mừng bạn đến với bảng điều khiển hệ thống. Vui lòng chọn một tác vụ xử lý nhanh bên dưới.</p>
    <hr class="my-4 mx-auto" style="width: 30%; height: 3px; background-color: #ffc107; border: none; opacity: 1;">

    <div class="row g-4 mt-2 justify-content-center">

        <div class="col-md-4">
            <div class="card h-100 border-start border-primary border-4 shadow-sm hover-card">
                <div class="card-body p-4">
                    <div class="fs-1 text-primary mb-2"><i class="bi bi-door-open"></i></div>
                    <h5 class="card-title fw-bold">Danh Mục Phòng</h5>
                    <p class="card-text text-secondary small">Khai báo thông tin số phòng, phân loại phòng đơn/đôi/VIP và cấu hình giá cơ bản.</p>
                    <a href="${pageContext.request.contextPath}/phong/new" class="btn btn-primary btn-sm px-4 fw-bold">Thực Hiện</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card h-100 border-start border-success border-4 shadow-sm hover-card">
                <div class="card-body p-4">
                    <div class="fs-1 text-success mb-2"><i class="bi bi-person-plus"></i></div>
                    <h5 class="card-title fw-bold">Quản Lý Khách Hàng</h5>
                    <p class="card-text text-secondary small">Tiếp nhận thông tin lưu trú, lưu trữ họ tên, số CMND/CCCD định danh và số điện thoại.</p>
                    <a href="${pageContext.request.contextPath}/khachhang/new" class="btn btn-success btn-sm px-4 fw-bold text-white">Thực Hiện</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card h-100 border-start border-warning border-4 shadow-sm hover-card">
                <div class="card-body p-4">
                    <div class="fs-1 text-warning mb-2"><i class="bi bi-calendar-check"></i></div>
                    <h5 class="card-title fw-bold">Phiếu Đặt Phòng</h5>
                    <p class="card-text text-secondary small">Xử lý kiểm tra lịch trống phòng động, quản lý ngày nhận/ngày trả và tiền cọc phòng.</p>
                    <a href="${pageContext.request.contextPath}/datphong/new" class="btn btn-warning btn-sm px-4 fw-bold">Thực Hiện</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card h-100 border-start border-info border-4 shadow-sm hover-card">
                <div class="card-body p-4">
                    <div class="fs-1 text-info mb-2"><i class="bi bi-search text-info"></i></div>
                    <h5 class="card-title fw-bold">Tra Cứu Khách Hàng</h5>
                    <p class="card-text text-secondary small">Tìm kiếm nhanh danh sách hồ sơ khách hàng theo bộ lọc tên hoặc theo số CMND/CCCD.</p>
                    <a href="${pageContext.request.contextPath}/search/khachhang" class="btn btn-info btn-sm px-4 fw-bold text-white">Xử Lý</a>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card h-100 border-start border-dark border-4 shadow-sm hover-card">
                <div class="card-body p-4">
                    <div class="fs-1 text-dark mb-2"><i class="bi bi-clock-history"></i></div>
                    <h5 class="card-title fw-bold">Lịch Sử Lưu Trú</h5>
                    <p class="card-text text-secondary small">Thống kê toàn bộ dòng thời gian giao dịch đặt phòng trước đây dựa trên từng khách hàng.</p>
                    <a href="${pageContext.request.contextPath}/search/lichsu" class="btn btn-dark btn-sm px-4 fw-bold">Xử Lý</a>
                </div>
            </div>
        </div>

    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>