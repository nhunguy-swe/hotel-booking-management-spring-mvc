package com.example.quanlykhachsan.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "KHACH_HANG")
public class KhachHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma_khach_hang")
    private Integer maKhachHang;

    @NotBlank(message = "Họ tên không được để trống")
    @Column(name = "ho_ten")
    private String hoTen;

    @NotBlank(message = "CCCD không được trống")
    @Pattern(regexp = "\\d{12}", message = "Số CMND/CCCD phải đúng 12 chữ số")
    @Column(name = "cccd", unique = true)
    private String cccd;

    @NotBlank(message = "Số điện thoại không được trống")
    @Pattern(regexp = "0\\d{9}", message = "Số điện thoại phải bắt đầu bằng số 0 và đủ 10 số")
    @Column(name = "so_dien_thoai")
    private String soDienThoai;

    // Getters, Setters
    public Integer getMaKhachHang() { return maKhachHang; }
    public void setMaKhachHang(Integer maKhachHang) { this.maKhachHang = maKhachHang; }
    public String getHoTen() { return hoTen; }
    public void setHoTen(String hoTen) { this.hoTen = hoTen; }
    public String getCccd() { return cccd; }
    public void setCccd(String cccd) { this.cccd = cccd; }
    public String getSoDienThoai() { return soDienThoai; }
    public void setSoDienThoai(String soDienThoai) { this.soDienThoai = soDienThoai; }
}
