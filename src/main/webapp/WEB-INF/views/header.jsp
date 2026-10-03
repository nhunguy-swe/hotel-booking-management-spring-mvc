<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Khách Sạn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f8f9fa;
        }
        .main-content {
            flex: 1;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold text-warning" href="${pageContext.request.contextPath}/">
            <i class="bi bi-building-fill-check"></i> KHÁCH SẠN LUXURY
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/phong/new">
                        <i class="bi bi-door-open"></i> Thêm Phòng
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/khachhang/new">
                        <i class="bi bi-person-plus"></i> Thêm Khách Hàng
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/datphong/new">
                        <i class="bi bi-calendar-check"></i> Đặt Phòng
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                        <i class="bi bi-search"></i> Tra Cứu
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-menu-item dropdown-item" href="${pageContext.request.contextPath}/search/khachhang">Tìm Khách Hàng</a></li>
                        <li><a class="dropdown-menu-item dropdown-item" href="${pageContext.request.contextPath}/search/lichsu">Lịch Sử Đặt Phòng</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container main-content">