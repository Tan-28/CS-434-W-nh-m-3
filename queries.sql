CREATE TABLE ChucVu (
    ChucVu_ID INT PRIMARY KEY,
    Ten NVARCHAR(50) NOT NULL,
    MoTa NVARCHAR(255)
);
CREATE TABLE NhanVien (
    NhanVien_ID INT PRIMARY KEY,
    Ten NVARCHAR(50) NOT NULL,
    SDT NVARCHAR(15),
    TenTaiKhoan NVARCHAR(50) UNIQUE NOT NULL,
    MatKhau NVARCHAR(50) NOT NULL,
    ChucVu_ID INT NOT NULL,
    FOREIGN KEY (ChucVu_ID) REFERENCES ChucVu(ChucVu_ID)
);
CREATE TABLE KhachHang (
    KhachHang_ID INT PRIMARY KEY,
    Ten NVARCHAR(50) NOT NULL,
    SDT NVARCHAR(15),
    DiaChi NVARCHAR(255),
    SoDu DECIMAL(18, 2) DEFAULT 0
);
CREATE TABLE MonAn (
    MonAn_ID INT PRIMARY KEY,
    Ten NVARCHAR(50) NOT NULL,
    HinhAnh NVARCHAR(255),
    DonGia DECIMAL(18, 2) NOT NULL
);
CREATE TABLE HoaDon (
    HoaDon_ID INT PRIMARY KEY,
    KhachHang_ID INT NOT NULL,
    NhanVien_ID INT,
    ThoiGian DATETIME NOT NULL,
    TongTien DECIMAL(18, 2) NOT NULL,
    FOREIGN KEY (KhachHang_ID) REFERENCES KhachHang(KhachHang_ID),
    FOREIGN KEY (NhanVien_ID) REFERENCES NhanVien(NhanVien_ID)
);
CREATE TABLE ChiTietHoaDon (
    HoaDon_ID INT NOT NULL,
    MonAn_ID INT NOT NULL,
    SoLuong INT NOT NULL,
    ThanhTien DECIMAL(18, 2) NOT NULL,
    PRIMARY KEY (HoaDon_ID, MonAn_ID),
    FOREIGN KEY (HoaDon_ID) REFERENCES HoaDon(HoaDon_ID),
    FOREIGN KEY (MonAn_ID) REFERENCES MonAn(MonAn_ID)
);
CREATE TABLE TinhTrangMay (
    TinhTrangMay_ID INT PRIMARY KEY,
    MoTa NVARCHAR(255)
);
CREATE TABLE KhuVuc (
    KhuVuc_ID INT PRIMARY KEY,
    Ten NVARCHAR(50),
    GiaGio DECIMAL(18, 2)
);
CREATE TABLE MayTinh (
    MayTinh_ID INT PRIMARY KEY,
    CauHinh NVARCHAR(255),
    TinhTrangMay_ID INT NOT NULL,
    KhuVuc_ID INT NOT NULL,
    FOREIGN KEY (TinhTrangMay_ID) REFERENCES TinhTrangMay(TinhTrangMay_ID),
    FOREIGN KEY (KhuVuc_ID) REFERENCES KhuVuc(KhuVuc_ID)
);
CREATE TABLE Session (
    Session_ID INT PRIMARY KEY,
    KhachHang_ID INT NOT NULL,
    MayTinh_ID INT NOT NULL,
    ThoiGianDangNhap DATETIME NOT NULL,
    ThoiGianDangXuat DATETIME,
    FOREIGN KEY (KhachHang_ID) REFERENCES KhachHang(KhachHang_ID),
    FOREIGN KEY (MayTinh_ID) REFERENCES MayTinh(MayTinh_ID)
);
CREATE TABLE LichSuNap (
    LichSuNap_ID INT PRIMARY KEY,
    KhachHang_ID INT NOT NULL,
    NhanVien_ID INT NOT NULL,
    SoTien DECIMAL(18, 2) NOT NULL,
    ThoiGian DATETIME NOT NULL,
    FOREIGN KEY (KhachHang_ID) REFERENCES KhachHang(KhachHang_ID),
    FOREIGN KEY (NhanVien_ID) REFERENCES NhanVien(NhanVien_ID)
);
INSERT INTO ChucVu VALUES (1, 'Quản lý', 'Chịu trách nhiệm quản lý hệ thống');
INSERT INTO ChucVu VALUES (2, 'Nhân viên', 'Hỗ trợ khách hàng và vận hành');
INSERT INTO ChucVu VALUES (3, 'Kỹ thuật viên', 'Đảm bảo kỹ thuật vận hành');
INSERT INTO NhanVien VALUES (101, 'Nguyễn Văn A', '0123456789', 'nguyenvana', 'pass123', 1);
INSERT INTO NhanVien VALUES (102, 'Trần Văn B', '0987654321', 'tranvanb', 'pass456', 2);
INSERT INTO NhanVien VALUES (103, 'Lê Thị C', '0911223344', 'lethic', 'pass789', 3);
INSERT INTO NhanVien VALUES (104, 'Phạm Thị D', '0944556677', 'phamthid', 'pass999', 2);
INSERT INTO KhachHang VALUES 
(201, 'Nguyễn Hoàng An', '0901234567', '123 Đường ABC', 500000),
(202, 'Phạm Văn Bảo', '0909876543', '456 Đường DEF', 200000),
(203, 'Trần Thị Cẩm', '0905555555', '789 Đường GHI', 300000),
(204, 'Hoàng Văn Dương', '0907777777', '111 Đường JKL', 150000),
(205, 'Lê Minh Hà', '0912333444', '222 Đường MNO', 250000),
(206, 'Nguyễn Thị Hồng', '0922445566', '333 Đường PQR', 450000),
(207, 'Trần Văn Khánh', '0933445566', '444 Đường STU', 600000),
(208, 'Phạm Thị Lan', '0944556677', '555 Đường VWX', 350000),
(209, 'Hoàng Minh Phương', '0955667788', '666 Đường YZA', 500000),
(210, 'Lê Văn Quân', '0966778899', '777 Đường BCD', 300000);
INSERT INTO MonAn VALUES 
(301, 'Bánh mì', NULL, 20000),
(302, 'Phở bò', NULL, 40000),
(303, 'Cà phê', NULL, 15000),
(304, 'Bánh xèo', NULL, 25000),
(305, 'Gỏi cuốn', NULL, 15000),
(306, 'Cơm tấm', NULL, 35000),
(307, 'Hủ tiếu', NULL, 30000),
(308, 'Bún chả', NULL, 35000),
(309, 'Mì Quảng', NULL, 30000),
(310, 'Xôi mặn', NULL, 22000),
(311, 'Cháo lòng', NULL, 18000),
(312, 'Súp cua', NULL, 25000),
(313, 'Gà nướng', NULL, 45000),
(314, 'Bò lúc lắc', NULL, 50000),
(315, 'Bánh bao', NULL, 20000);
INSERT INTO TinhTrangMay (TinhTrangMay_ID, MoTa) VALUES
(501, 'Đang hoạt động'), (502, 'Đang bảo trì'), 
(503, 'Đang hoạt động'), (504, 'Đang bảo trì'),
(505, 'Đang hoạt động'), (506, 'Đang bảo trì'),
(507, 'Đang hoạt động'), (508, 'Đang bảo trì'),
(509, 'Đang hoạt động'), (510, 'Đang bảo trì'),
(511, 'Đang hoạt động'), (512, 'Đang bảo trì'),
(513, 'Đang hoạt động'), (514, 'Đang bảo trì'),
(515, 'Đang hoạt động'), (516, 'Đang bảo trì'),
(517, 'Đang hoạt động'), (518, 'Đang bảo trì'),
(519, 'Đang hoạt động'), (520, 'Đang bảo trì');
INSERT INTO KhuVuc VALUES 
(401, 'Khu A', 5000),
(402, 'Khu B', 7000),
(403, 'Khu C', 6000),
(404, 'Khu D', 8000),
(405, 'Khu E', 5500),
(406, 'Khu F', 7500),
(407, 'Khu G', 6500),
(408, 'Khu H', 8500),
(409, 'Khu I', 7000),
(410, 'Khu J', 7200),
(411, 'Khu K', 7600),
(412, 'Khu L', 7800),
(413, 'Khu M', 6900),
(414, 'Khu N', 7700),
(415, 'Khu O', 7300);
INSERT INTO MayTinh VALUES 
(601, 'Core i5, 8GB RAM', 501, 401),
(602, 'Core i7, 16GB RAM', 501, 402),
(603, 'Core i3, 4GB RAM', 502, 401),
(604, 'Core i5, 8GB RAM', 501, 402),
(605, 'Core i9, 32GB RAM', 501, 401),
(606, 'Core i5, 16GB RAM', 501, 401),
(607, 'Core i7, 8GB RAM', 501, 402),
(608, 'Core i3, 4GB RAM', 502, 402),
(609, 'Core i9, 16GB RAM', 501, 401),
(610, 'Core i5, 4GB RAM', 502, 402),
(611, 'Core i7, 32GB RAM', 501, 401),
(612, 'Core i3, 16GB RAM', 502, 402),
(613, 'Core i5, 8GB RAM', 501, 401),
(614, 'Core i7, 8GB RAM', 502, 402),
(615, 'Core i3, 4GB RAM', 501, 401),
(616, 'Core i9, 32GB RAM', 501, 402),
(617, 'Core i5, 16GB RAM', 502, 401),
(618, 'Core i7, 8GB RAM', 501, 401),
(619, 'Core i9, 16GB RAM', 502, 402),
(620, 'Core i3, 8GB RAM', 501, 401);
SELECT * FROM ChucVu;
SELECT * FROM NhanVien WHERE ChucVu_ID = 2;
SELECT * FROM KhachHang WHERE SoDu > 300000;
SELECT * FROM MonAn;
SELECT * FROM MayTinh;
