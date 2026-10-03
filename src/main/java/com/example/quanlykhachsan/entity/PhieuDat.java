package com.example.quanlykhachsan.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

@Entity
@Table(name = "PHIEU_DAT")
public class PhieuDat {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma_phieu")
    private Integer maPhieu;

    @ManyToOne
    @JoinColumn(name = "ma_khach_hang")
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "ma_phong")
    private Phong phong;

    @NotNull(message = "Vui lòng chọn ngày nhận phòng")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_nhan")
    private Date ngayNhan;

    @NotNull(message = "Vui lòng chọn ngày trả phòng")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    @Column(name = "ngay_tra")
    private Date ngayTra;

    @NotNull(message = "Tiền cọc không được trống")
    @Min(value = 0, message = "Tiền cọc phải từ 0 đồng trở lên")
    @Column(name = "tien_coc")
    private Double tienCoc;

    // Getters, Setters
    public Integer getMaPhieu() { return maPhieu; }
    public void setMaPhieu(Integer maPhieu) { this.maPhieu = maPhieu; }
    public KhachHang getKhachHang() { return khachHang; }
    public void setKhachHang(KhachHang khachHang) { this.khachHang = khachHang; }
    public Phong getPhong() { return phong; }
    public void setPhong(Phong phong) { this.phong = phong; }
    public Date getNgayNhan() { return ngayNhan; }
    public void setNgayNhan(Date ngayNhan) { this.ngayNhan = ngayNhan; }
    public Date getNgayTra() { return ngayTra; }
    public void setNgayTra(Date ngayTra) { this.ngayTra = ngayTra; }
    public Double getTienCoc() { return tienCoc; }
    public void setTienCoc(Double tienCoc) { this.tienCoc = tienCoc; }
}