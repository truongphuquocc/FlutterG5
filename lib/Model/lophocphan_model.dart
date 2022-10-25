class LopHocPhanModel {
  String? hinhNen;
  String? maLopHoc;
  String? tenLopHocPhan;
  int? soLuongSinhVien;

  LopHocPhanModel(
      {this.hinhNen, this.maLopHoc, this.tenLopHocPhan, this.soLuongSinhVien});
}

List<LopHocPhanModel> ls = [
  LopHocPhanModel(
      hinhNen: "Assets/Images/img_sl1.jpg",
      maLopHoc: "TIN3412.003",
      tenLopHocPhan: "Thuc Tap Viet Nien Luan",
      soLuongSinhVien: 10),
  LopHocPhanModel(
      hinhNen: "Assets/Images/cl1.jpg",
      maLopHoc: "TIN3423.003",
      tenLopHocPhan: "Lap trinh web",
      soLuongSinhVien: 12),
  LopHocPhanModel(
      hinhNen: "Assets/Images/cl2.jpg",
      maLopHoc: "TIN3423.003",
      tenLopHocPhan: "Java nâng cao",
      soLuongSinhVien: 12),
  LopHocPhanModel(
      hinhNen: "Assets/Images/cl1.jpg",
      maLopHoc: "TIN3423.003",
      tenLopHocPhan: "Ma nguon mo",
      soLuongSinhVien: 40),
  LopHocPhanModel(
      hinhNen: "Assets/Images/cl2.jpg",
      maLopHoc: "TIN3423.003",
      tenLopHocPhan: "Python",
      soLuongSinhVien: 40),
];
