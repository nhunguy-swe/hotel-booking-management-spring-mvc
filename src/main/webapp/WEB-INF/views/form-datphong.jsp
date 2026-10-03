<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Lập Phiếu Đặt Phòng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="card col-md-6 mx-auto shadow">
    <div class="card-header bg-warning text-dark"><h3>Tạo Phiếu Đặt Phòng</h3></div>
    <div class="card-body">
        <c:if test="${param.success == 'true'}"><div class="alert alert-success">Đặt phòng thành công!</div></c:if>
        <c:if test="${not empty dateError}"><div class="alert alert-danger">${dateError}</div></c:if>

        <form:form method="POST" modelAttribute="phieuDat" id="bookingForm">
            <div class="mb-3">
                <label class="form-label">Chọn Khách Hàng</label>
                <form:select path="khachHang.maKhachHang" class="form-select">
                    <form:option value="" label="-- Chọn khách hàng --" />
                    <form:options items="${danhSachKhachHang}" itemValue="maKhachHang" itemLabel="hoTen"/>
                </form:select>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Ngày Nhận Phòng</label>
                    <form:input type="date" path="ngayNhan" class="form-control" id="ngayNhan"/>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Ngày Trả Phòng</label>
                    <form:input type="date" path="ngayTra" class="form-control" id="ngayTra"/>
                </div>
            </div>

            <div class="mb-3">
                <button type="button" class="btn btn-outline-secondary w-100 btn-sm" onclick="checkAvailableRooms()">
                    <i class="bi bi-search"></i> Bấm vào đây để kiểm tra phòng trống lịch này
                </button>
            </div>

            <div class="mb-3">
                <label class="form-label">Chọn Phòng Trống (Chỉ hiển thị sau khi kiểm tra lịch)</label>
                <form:select path="phong.maPhong" class="form-select">
                    <form:option value="" label="-- Chọn phòng --" />
                    <c:forEach var="p" items="${danhSachPhong}">
                        <form:option value="${p.maPhong}" label="Phòng ${p.soPhong} (${p.loaiPhong} - ${p.giaPhong}đ)" />
                    </c:forEach>
                </form:select>
                <form:errors path="phong" cssClass="text-danger"/>
            </div>

            <div class="mb-3">
                <label class="form-label">Tiền Đặt Cọc</label>
                <form:input type="number" path="tienCoc" class="form-control"/>
                <form:errors path="tienCoc" cssClass="text-danger"/>
            </div>

            <button type="button" class="btn btn-warning w-100 fw-bold" onclick="submitBooking()">Xác Nhận Đặt Phòng</button>
        </form:form>
    </div>
</div>

<script>
    // Hàm này đổi hành động của form thành check-room để load lại danh sách phòng trống
    function checkAvailableRooms() {
        var form = document.getElementById('bookingForm');
        form.action = "${pageContext.request.contextPath}/datphong/check-room";
        form.submit();
    }

    // Hàm này đổi hành động của form thành lưu phiếu đặt phòng chính thức
    function submitBooking() {
        var form = document.getElementById('bookingForm');
        form.action = "${pageContext.request.contextPath}/datphong/new";
        form.submit();
    }
</script>

<jsp:include page="footer.jsp" />
</body>
</html>