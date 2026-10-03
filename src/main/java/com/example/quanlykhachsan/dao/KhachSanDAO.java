package com.example.quanlykhachsan.dao;

import com.example.quanlykhachsan.entity.KhachHang;
import com.example.quanlykhachsan.entity.PhieuDat;
import com.example.quanlykhachsan.entity.Phong;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Transactional
public class KhachSanDAO {

    @PersistenceContext
    private EntityManager em;

    // --- PHONG ---
    public void savePhong(Phong p) { em.persist(p); }
    public List<Phong> getAllPhong() {
        return em.createQuery("FROM Phong", Phong.class).getResultList();
    }
//    public List<Phong> getPhongTrong() {
//        return em.createQuery("FROM Phong WHERE trangThai = 'Trống'", Phong.class).getResultList();
//    }

    public List<Phong> getPhongTrongTheoThoiGian(java.util.Date ngayNhan, java.util.Date ngayTra) {
        String hql = "FROM Phong p WHERE p.maPhong NOT IN (" +
                "  SELECT pd.phong.maPhong FROM PhieuDat pd " +
                "  WHERE (pd.ngayNhan < :ngayTra AND pd.ngayTra > :ngayNhan)" +
                ")";

        return em.createQuery(hql, Phong.class)
                .setParameter("ngayNhan", ngayNhan)
                .setParameter("ngayTra", ngayTra)
                .getResultList();
    }

    // --- KHACH HANG ---
    public void saveKhachHang(KhachHang kh) { em.persist(kh); }
    public List<KhachHang> getAllKhachHang() {
        return em.createQuery("FROM KhachHang", KhachHang.class).getResultList();
    }

    // Tìm kiếm khách hàng theo tên hoặc CCCD
    public List<KhachHang> searchKhachHang(String keyword) {
        return em.createQuery("FROM KhachHang WHERE hoTen LIKE :kw OR cccd LIKE :kw", KhachHang.class)
                .setParameter("kw", "%" + keyword + "%")
                .getResultList();
    }

    // --- PHIEU DAT ---
    public void savePhieuDat(PhieuDat pd) {
        em.persist(pd);
        // Cập nhật trạng thái phòng thành 'Đã đặt'
//        Phong p = em.find(Phong.class, pd.getPhong().getMaPhong());
//        if(p != null) p.setTrangThai("Đã đặt");
    }

    // Tìm kiếm lịch sử theo mã khách hàng
    public List<PhieuDat> getLichSuDatPhong(Integer maKhachHang) {
        return em.createQuery("FROM PhieuDat WHERE khachHang.maKhachHang = :maKH", PhieuDat.class)
                .setParameter("maKH", maKhachHang)
                .getResultList();
    }
}
