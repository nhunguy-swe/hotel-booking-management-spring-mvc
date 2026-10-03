<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Tìm Kiếm Khách Hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="card shadow mb-4">
    <div class="card-header bg-info text-white">
        <h4 class="mb-0"><i class="bi bi-search"></i> Tra Cứu Thông Tin Khách Hàng</h4>
    </div>
    <div class="card-body p-4">
        <form action="${pageContext.request.contextPath}/search/khachhang" method="GET" class="row g-3 mb-4">
            <div class="col-md-9">
                <div class="input-group">
                    <span class="input-group-text bg-light"><i class="bi bi-person-bounding-box"></i></span>
                    <input type="text" name="keyword" class="form-control" value="${keyword}" placeholder="Nhập họ tên hoặc số CMND/CCCD cần tìm...">
                </div>
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-info w-100 fw-bold text-white">
                    <i class="bi bi-search"></i> Tìm Kiếm
                </button>
            </div>
        </form>

        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover align-middle mb-0">
                <thead class="table-dark">
                <tr>
                    <th style="width: 10%;">Mã KH</th>
                    <th style="width: 35%;">Họ Tên</th>
                    <th style="width: 30%;">Số CMND/CCCD</th>
                    <th style="width: 25%;">Số Điện Thoại</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="kh" items="${listKH}">
                    <tr>
                        <td><span class="badge bg-secondary">${kh.maKhachHang}</span></td>
                        <td class="fw-bold text-secondary">${kh.hoTen}</td>
                        <td><code>${kh.cccd}</code></td>
                        <td>${kh.soDienThoai}</td>
                    </tr>
                </c:forEach>
                <c:if test="${empty listKH && not empty keyword}">
                    <tr>
                        <td colspan="4" class="text-center text-danger py-3">
                            <i class="bi bi-exclamation-triangle-fill"></i> Không tìm thấy khách hàng nào phù hợp với từ khóa "<strong>${keyword}</strong>"!
                        </td>
                    </tr>
                </c:if>
                <c:if test="${empty listKH && empty keyword}">
                    <tr>
                        <td colspan="4" class="text-center text-muted py-3">
                            <i class="bi bi-info-circle"></i> Vui lòng nhập thông tin để tìm kiếm.
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>