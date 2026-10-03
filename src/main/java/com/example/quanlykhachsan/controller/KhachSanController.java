package com.example.quanlykhachsan.controller;

import com.example.quanlykhachsan.dao.KhachSanDAO;
import com.example.quanlykhachsan.entity.KhachHang;
import com.example.quanlykhachsan.entity.PhieuDat;
import com.example.quanlykhachsan.entity.Phong;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class KhachSanController {

    @Autowired
    private KhachSanDAO khachSanDAO;

    @GetMapping("/")
    public String index() { return "index"; }

    // 1. Form Nhập Phòng
    @GetMapping("/phong/new")
    public String showPhongForm(Model model) {
        model.addAttribute("phong", new Phong());
        return "form-phong";
    }

    @PostMapping("/phong/new")
    public String savePhong(@Valid @ModelAttribute("phong") Phong phong, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "form-phong";
        }
        khachSanDAO.savePhong(phong);
        model.addAttribute("message", "Thêm phòng thành công!");
        model.addAttribute("phong", new Phong());
        return "form-phong";
    }

    // 2. Form Nhập Khách Hàng
    @GetMapping("/khachhang/new")
    public String showKhachHangForm(Model model) {
        model.addAttribute("khachHang", new KhachHang());
        return "form-khachhang";
    }

    @PostMapping("/khachhang/new")
    public String saveKhachHang(@Valid @ModelAttribute("khachHang") KhachHang khachHang, BindingResult result, Model model) {
        if (result.hasErrors()) {
            return "form-khachhang";
        }
        khachSanDAO.saveKhachHang(khachHang);
        model.addAttribute("message", "Thêm khách hàng thành công!");
        model.addAttribute("khachHang", new KhachHang());
        return "form-khachhang";
    }

    // 3. Form Đặt Phòng
    // 1. Khi mới vào trang Đặt phòng
    @GetMapping("/datphong/new")
    public String showDatPhongForm(Model model) {
        model.addAttribute("phieuDat", new PhieuDat());
        model.addAttribute("danhSachKhachHang", khachSanDAO.getAllKhachHang());
        // Mới vào chưa có ngày thì chưa load phòng, hoặc load tất cả phòng để làm cảnh
        return "form-datphong";
    }

    // 2. Tạo một Request phụ để tìm phòng trống khi người dùng nhập ngày và bấm nút "Tìm phòng"
    @PostMapping("/datphong/check-room")
    public String checkRoom(@ModelAttribute("phieuDat") PhieuDat phieuDat, Model model) {
        model.addAttribute("danhSachKhachHang", khachSanDAO.getAllKhachHang());

        if (phieuDat.getNgayNhan() != null && phieuDat.getNgayTra() != null) {
            if (!phieuDat.getNgayTra().after(phieuDat.getNgayNhan())) {
                model.addAttribute("dateError", "Ngày trả phòng phải sau ngày nhận phòng!");
            } else {
                // Gọi hàm lọc phòng trống động theo thời gian vừa viết ở Bước 1
                List<Phong> phongTrong = khachSanDAO.getPhongTrongTheoThoiGian(phieuDat.getNgayNhan(), phieuDat.getNgayTra());
                model.addAttribute("danhSachPhong", phongTrong);
            }
        } else {
            model.addAttribute("dateError", "Vui lòng chọn đầy đủ ngày nhận và ngày trả để kiểm tra phòng trống!");
        }
        return "form-datphong";
    }

    // 3. Xử lý khi nhấn nút "Xác Nhận Đặt Phòng" cuối cùng
    @PostMapping("/datphong/new")
    public String saveDatPhong(@Valid @ModelAttribute("phieuDat") PhieuDat phieuDat, BindingResult result, Model model) {
        if (result.hasErrors()) {
            model.addAttribute("danhSachKhachHang", khachSanDAO.getAllKhachHang());
            if (phieuDat.getNgayNhan() != null && phieuDat.getNgayTra() != null) {
                model.addAttribute("danhSachPhong", khachSanDAO.getPhongTrongTheoThoiGian(phieuDat.getNgayNhan(), phieuDat.getNgayTra()));
            }
            return "form-datphong";
        }

        khachSanDAO.savePhieuDat(phieuDat);
        return "redirect:/datphong/new?success=true";
    }

    // 4. Tìm kiếm khách hàng
    @GetMapping("/search/khachhang")
    public String searchKhachHang(@RequestParam(value = "keyword", required = false) String keyword, Model model) {
        if (keyword != null && !keyword.trim().isEmpty()) {
            List<KhachHang> list = khachSanDAO.searchKhachHang(keyword);
            model.addAttribute("listKH", list);
        }
        model.addAttribute("keyword", keyword);
        return "search-khachhang";
    }

    // 5. Tìm kiếm lịch sử đặt phòng theo mã khách hàng
    @GetMapping("/search/lichsu")
    public String searchLichSu(@RequestParam(value = "maKhachHang", required = false) Integer maKhachHang, Model model) {
        model.addAttribute("danhSachKhachHang", khachSanDAO.getAllKhachHang());
        if (maKhachHang != null) {
            List<PhieuDat> list = khachSanDAO.getLichSuDatPhong(maKhachHang);
            model.addAttribute("listPhieu", list);
        }
        model.addAttribute("selectedKH", maKhachHang);
        return "search-lichsu";
    }
}
