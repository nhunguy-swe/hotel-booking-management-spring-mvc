<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Lịch Sử Đặt Phòng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="card shadow mb-4">
    <div class="card-header bg-dark text-white border-bottom border-warning border-2">
        <h4 class="mb-0 text-warning"><i class="bi bi-clock-history"></i> Tra Cứu Lịch Sử Đặt Phòng</h4>
    </div>
    <div class="card-body p-4">

        <form action="${pageContext.request.contextPath}/search/lichsu" method="GET" class="row g-3 mb-4 align-items-center">
            <div class="col-md-9">
                <div class="input-group">
                    <span class="input-group-text bg-light"><i class="bi bi-person-lines-fill"></i></span>
                    <select name="maKhachHang" class="form-select">
                        <option value="">-- Chọn khách hàng để xem lịch sử đặt phòng --</option>
                        <c:forEach var="kh" items="${danhSachKhachHang}">
                            <option value="${kh.maKhachHang}" ${kh.maKhachHang == selectedKH ? 'selected' : ''}>
                                    ${kh.hoTen} (CCCD: ${kh.cccd})
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="col-md-3">
                <button type="submit" class="btn btn-dark w-100 fw-bold border-warning text-warning">
                    <i class="bi bi-eye-fill"></i> Xem Lịch Sử
                </button>
            </div>
        </form>

        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover align-middle mb-0">
                <thead class="table-secondary text-uppercase small fw-bold">
                <tr>
                    <th style="width: 15%;">Mã Phiếu</th>
                    <th style="width: 20%;">Số Phòng</th>
                    <th style="width: 22%;">Ngày Nhận</th>
                    <th style="width: 22%;">Ngày Trả</th>
                    <th style="width: 21%;">Tiền Đặt Cọc</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="p" items="${listPhieu}">
                    <tr>
                        <td><span class="badge bg-dark">#${p.maPhieu}</span></td>
                        <td>
                                <span class="text-primary fw-bold">
                                    <i class="bi bi-door-closed-fill"></i> Phòng ${p.phong.soPhong}
                                </span>
                        </td>
                        <td>
                                <span class="badge bg-light text-dark border">
                                    <i class="bi bi-calendar-event"></i> <fmt:formatDate value="${p.ngayNhan}" pattern="dd/MM/yyyy"/>
                                </span>
                        </td>
                        <td>
                                <span class="badge bg-light text-dark border">
                                    <i class="bi bi-calendar-check"></i> <fmt:formatDate value="${p.ngayTra}" pattern="dd/MM/yyyy"/>
                                </span>
                        </td>
                        <td class="text-end fw-bold text-success">
                            <fmt:formatNumber value="${p.tienCoc}" type="number"/> đ
                        </td>
                    </tr>
                </c:forEach>

                <%-- Trạng thái 1: Khách hàng được chọn nhưng chưa từng đặt phòng nào --%>
                <c:if test="${empty listPhieu && not empty selectedKH}">
                    <tr>
                        <td colspan="5" class="text-center text-muted py-4">
                            <i class="bi bi-folder-x fs-4 d-block mb-2"></i>
                            Khách hàng này hiện chưa có lịch sử đặt phòng tại hệ thống.
                        </td>
                    </tr>
                </c:if>

                <%-- Trạng thái 2: Khi mới mở trang và chưa chọn bất kỳ ai --%>
                <c:if test="${empty listPhieu && empty selectedKH}">
                    <tr>
                        <td colspan="5" class="text-center text-secondary py-4">
                            <i class="bi bi-arrow-up-circle fs-4 d-block mb-2 text-warning"></i>
                            Vui lòng chọn một khách hàng phía trên để tra cứu lịch sử chi tiết.
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