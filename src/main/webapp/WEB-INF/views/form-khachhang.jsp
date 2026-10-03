<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm Khách Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="card col-md-6 mx-auto shadow">
    <div class="card-header bg-success text-white">
        <h4 class="mb-0"><i class="bi bi-person-plus-fill"></i> Nhập Thông Tin Khách Hàng</h4>
    </div>
    <div class="card-body p-4">
        <c:if test="${not empty message}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle-fill"></i> ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <form:form action="${pageContext.request.contextPath}/khachhang/new" method="POST" modelAttribute="khachHang">
            <div class="mb-3">
                <label class="form-label fw-bold">Họ Tên</label>
                <form:input path="hoTen" class="form-control" placeholder="Nhập đầy đủ họ và tên..." />
                <form:errors path="hoTen" cssClass="text-danger small d-block mt-1" />
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Số CMND/CCCD (12 số)</label>
                <form:input path="cccd" class="form-control" placeholder="Ví dụ: 031093001234" />
                <form:errors path="cccd" cssClass="text-danger small d-block mt-1" />
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Số Điện Thoại</label>
                <form:input path="soDienThoai" class="form-control" placeholder="Bắt đầu bằng số 0, đủ 10 số..." />
                <form:errors path="soDienThoai" cssClass="text-danger small d-block mt-1" />
            </div>

            <button type="submit" class="btn btn-success w-100 fw-bold py-2 mt-2">
                <i class="bi bi-download"></i> Lưu Khách Hàng
            </button>
        </form:form>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>