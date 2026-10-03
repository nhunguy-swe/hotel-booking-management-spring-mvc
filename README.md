# HỆ THỐNG QUẢN LÝ ĐẶT PHÒNG KHÁCH SẠN

## 1. Giới thiệu

Hệ thống Quản lý Đặt phòng Khách sạn được xây dựng bằng Spring MVC nhằm hỗ trợ quản lý thông tin phòng, khách hàng và quá trình đặt phòng. Hệ thống cho phép nhập liệu, tìm kiếm và quản lý dữ liệu khách sạn một cách hiệu quả.

---

## 2. Công nghệ sử dụng

* Java
* Spring MVC
* Hibernate/JPA
* MySQL hoặc SQL Server
* JSP/Servlet
* Bootstrap (tùy chọn để cải thiện giao diện)
* Maven

---

## 3. Thiết kế cơ sở dữ liệu

### Bảng PHONG

| Tên cột   | Kiểu dữ liệu             | Mô tả                             |
| --------- | ------------------------ | --------------------------------- |
| maPhong   | INT (PK, AUTO_INCREMENT) | Mã phòng                          |
| soPhong   | VARCHAR(20)              | Số phòng                          |
| loaiPhong | VARCHAR(50)              | Phòng Đơn / Phòng Đôi / Phòng VIP |
| giaPhong  | DECIMAL                  | Giá phòng                         |
| trangThai | VARCHAR(20)              | Trống / Đã đặt                    |

### Bảng KHACH_HANG

| Tên cột     | Kiểu dữ liệu             | Mô tả             |
| ----------- | ------------------------ | ----------------- |
| maKhachHang | INT (PK, AUTO_INCREMENT) | Mã khách hàng     |
| hoTen       | VARCHAR(100)             | Họ tên khách hàng |
| cmnd        | VARCHAR(12)              | Số CMND/CCCD      |
| soDienThoai | VARCHAR(10)              | Số điện thoại     |

### Bảng PHIEU_DAT

| Tên cột       | Kiểu dữ liệu             | Mô tả           |
| ------------- | ------------------------ | --------------- |
| maPhieu       | INT (PK, AUTO_INCREMENT) | Mã phiếu đặt    |
| maKhachHang   | INT (FK)                 | Mã khách hàng   |
| maPhong       | INT (FK)                 | Mã phòng        |
| ngayNhanPhong | DATE                     | Ngày nhận phòng |
| ngayTraPhong  | DATE                     | Ngày trả phòng  |
| tienDatCoc    | DECIMAL                  | Tiền đặt cọc    |

---

## 4. Chức năng hệ thống

### 4.1 Quản lý Phòng

Cho phép thêm mới thông tin phòng:

* Số phòng
* Loại phòng

    * Phòng Đơn
    * Phòng Đôi
    * Phòng VIP
* Giá phòng
* Trạng thái

#### Validation

* Giá phòng phải là số nguyên dương.
* Giá phòng ≥ 100.000 VNĐ.

---

### 4.2 Quản lý Khách hàng

Cho phép thêm mới khách hàng:

* Họ tên
* CMND/CCCD
* Số điện thoại

#### Validation

**CMND/CCCD**

* Bắt buộc nhập.
* Gồm đúng 12 chữ số.

Regex:

```java
^[0-9]{12}$
```

**Số điện thoại**

* Bắt đầu bằng số 0.
* Gồm đúng 10 chữ số.

Regex:

```java
^0[0-9]{9}$
```

---

### 4.3 Đặt phòng

Cho phép lập phiếu đặt phòng.

Thông tin gồm:

* Khách hàng (ComboBox từ CSDL)
* Phòng (ComboBox từ CSDL)
* Ngày nhận phòng
* Ngày trả phòng
* Tiền đặt cọc

#### Validation

* Khách hàng phải được chọn.
* Phòng phải được chọn.
* Ngày trả phòng phải lớn hơn ngày nhận phòng.

---

## 5. Chức năng tìm kiếm

### 5.1 Tìm kiếm khách hàng

Cho phép tìm kiếm theo:

* Họ tên
* Số CMND/CCCD

Kết quả hiển thị:

* Mã khách hàng
* Họ tên
* CMND/CCCD
* Số điện thoại

---

### 5.2 Tìm kiếm lịch sử đặt phòng

Tìm kiếm theo:

* Mã khách hàng

Kết quả hiển thị:

* Mã phiếu
* Số phòng
* Ngày nhận phòng
* Ngày trả phòng
* Tiền đặt cọc

---

## 6. Kiến trúc dự án

```text
src/main/java
│
├── controller
│   ├── PhongController
│   ├── KhachHangController
│   └── PhieuDatController
│
├── entity
│   ├── Phong
│   ├── KhachHang
│   └── PhieuDat
│
├── dao
│   └── KhachSanDAO
│
├── service
│
└── config
    ├── WebConfig
    └── HibernateConfig
```

---

## 7. Yêu cầu kỹ thuật

### Framework

* Spring MVC
* Hibernate/JPA

### Cơ sở dữ liệu

* MySQL hoặc SQL Server

### Coding Convention

* Đặt tên class theo PascalCase.
* Đặt tên biến theo camelCase.
* Tách riêng Controller, Service, DAO, Entity.
* Code rõ ràng, dễ bảo trì.

---

## 8. Điểm cộng

Các tiêu chí cộng điểm:

* Giao diện đẹp.
* Responsive.
* Sử dụng Bootstrap.
* Bố cục rõ ràng, thân thiện người dùng.

---

## 9. Kết luận

Hệ thống đáp ứng đầy đủ các yêu cầu:

✔ Quản lý phòng

✔ Quản lý khách hàng

✔ Đặt phòng

✔ Kiểm tra dữ liệu đầu vào bằng Validation

✔ Tìm kiếm khách hàng

✔ Tìm kiếm lịch sử đặt phòng

✔ Áp dụng Spring MVC và Hibernate

✔ Tuân thủ Java Coding Convention
