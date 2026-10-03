package com.example.quanlykhachsan.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "PHONG")
public class Phong {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma_phong")
    private Integer maPhong;

    @NotBlank(message = "Số phòng không được để trống")
    @Column(name = "so_phong")
    private String soPhong;

    @NotBlank(message = "Vui lòng chọn loại phòng")
    @Column(name = "loai_phong")
    private String loaiPhong;

    @NotNull(message = "Giá phòng không được trống")
    @Min(value = 100000, message = "Giá phòng phải lớn hơn hoặc bằng 100,000đ")
    @Column(name = "gia_phong")
    private Double giaPhong;

    @NotBlank(message = "Trạng thái không được trống")
    @Column(name = "trang_thai")
    private String trangThai = "Trống";

    // Getters, Setters, Constructors
    public Integer getMaPhong() { return maPhong; }
    public void setMaPhong(Integer maPhong) { this.maPhong = maPhong; }
    public String getSoPhong() { return soPhong; }
    public void setSoPhong(String soPhong) { this.soPhong = soPhong; }
    public String getLoaiPhong() { return loaiPhong; }
    public void setLoaiPhong(String loaiPhong) { this.loaiPhong = loaiPhong; }
    public Double getGiaPhong() { return giaPhong; }
    public void setGiaPhong(Double giaPhong) { this.giaPhong = giaPhong; }
    public String getTrangThai() { return trangThai; }
    public void setTrangThai(String trangThai) { this.trangThai = trangThai; }
}
