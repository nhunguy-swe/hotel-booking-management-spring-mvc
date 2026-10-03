<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Thêm Phòng Mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="card col-md-6 mx-auto shadow">
    <div class="card-header bg-primary text-white">
        <h4 class="mb-0"><i class="bi bi-door-open-fill"></i> Nhập Thông Tin Phòng Mới</h4>
    </div>
    <div class="card-body p-4">
        <c:if test="${not empty message}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <i class="bi bi-check-circle-fill"></i> ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <form:form action="${pageContext.request.contextPath}/phong/new" method="POST" modelAttribute="phong">
            <div class="mb-3">
                <label class="form-label fw-bold">Số Phòng</label>
                <form:input path="soPhong" class="form-control" placeholder="Ví dụ: P101, P205..." />
                <form:errors path="soPhong" cssClass="text-danger small d-block mt-1" />
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Loại Phòng</label>
                <form:select path="loaiPhong" class="form-select">
                    <form:option value="" label="-- Chọn loại phòng --"/>
                    <form:option value="Phòng Đơn" label="Phòng Đơn"/>
                    <form:option value="Phòng Đôi" label="Phòng Đôi"/>
                    <form:option value="Phòng VIP" label="Phòng VIP"/>
                </form:select>
                <form:errors path="loaiPhong" cssClass="text-danger small d-block mt-1" />
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Giá Phòng</label>
                <div class="input-group">
                    <form:input type="number" path="giaPhong" class="form-control" placeholder="Tối thiểu từ 100.000đ..." />
                    <span class="input-group-text">VND</span>
                </div>
                <form:errors path="giaPhong" cssClass="text-danger small d-block mt-1" />
            </div>

            <button type="submit" class="btn btn-primary w-100 fw-bold py-2 mt-2">
                <i class="bi bi-save-fill"></i> Lưu Thông Tin Phòng
            </button>
        </form:form>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>