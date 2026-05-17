import 'dart:async';

class XeHoi {
  String tenXe;

  XeHoi(this.tenXe);

  XeHoi.xeDien(this.tenXe) {
    print("Đã tạo xe điện");
  }

  void hienThiThongTin() {
    print("Tên xe: $tenXe");
  }
}

class XeDien extends XeHoi {
  XeDien(String tenXe) : super(tenXe);

  @override
  void hienThiThongTin() {
    print("Xe điện: $tenXe");
  }
}

Future<void> main() async {

  print("========== EXERCISE 1 ==========");

  int tuoi = 22;
  double chieuCao = 1.85;
  String hoTen = "Duy Anh";
  bool dangHocDart = true;

  print("Họ tên: $hoTen");
  print("Tuổi: $tuoi");
  print("Chiều cao: $chieuCao");
  print("Đang học Dart: $dangHocDart");
  print("Tuổi năm sau: ${tuoi + 1}");



  print("\n========== EXERCISE 2 ==========");

  List<int> diemSo = [8, 9, 7, 10, 6];

  print("Danh sách điểm: $diemSo");

  diemSo.add(5);
  print("Sau khi thêm: $diemSo");

  diemSo.remove(7);
  print("Sau khi xoá: $diemSo");

  print("Điểm đầu tiên: ${diemSo[0]}");

  int soA = 10;
  int soB = 5;

  print("Cộng: ${soA + soB}");
  print("Trừ: ${soA - soB}");
  print("So sánh bằng: ${soA == soB}");
  print("Điều kiện AND: ${(soA > soB) && (soB > 0)}");

  String ketQua = soA > soB ? "A lớn hơn B" : "B lớn hơn A";
  print(ketQua);

  Set<String> banBe = {"Hà Chi", "Huy", "Đức Anh", "Huy"};

  print("Danh sách bạn bè: $banBe");

  Map<String, dynamic> sinhVien = {
    "ten": "Duy Anh",
    "tuoi": 22,
    "lop": "SE1841",
  };

  print("Thông tin sinh viên: $sinhVien");
  print("Tên sinh viên: ${sinhVien["ten"]}");

  sinhVien["tuoi"] = 23;
  print("Sau khi cập nhật: $sinhVien");



  print("\n========== EXERCISE 3 ==========");

  int diemThi = 85;

  if (diemThi >= 90) {
    print("Xếp loại A");
  } else if (diemThi >= 75) {
    print("Xếp loại B");
  } else {
    print("Xếp loại C");
  }

  String thu = "Monday";

  switch (thu) {
    case "Monday":
      print("Đầu tuần");
      break;

    case "Friday":
      print("Sắp cuối tuần");
      break;

    default:
      print("Ngày bình thường");
  }

  List<String> monHoc = ["Flutter", "ReactJS", "NodeJS"];

  print("\nVòng lặp for:");
  for (int i = 0; i < monHoc.length; i++) {
    print(monHoc[i]);
  }

  print("\nVòng lặp for-in:");
  for (String mon in monHoc) {
    print(mon);
  }

  print("\nforEach:");
  monHoc.forEach((mon) {
    print(mon);
  });

  int tinhTong(int a, int b) {
    return a + b;
  }

  int tinhNhan(int a, int b) => a * b;

  print("\nTổng: ${tinhTong(5, 3)}");
  print("Nhân: ${tinhNhan(4, 2)}");



  print("\n========== EXERCISE 4 ==========");

  XeHoi xe1 = XeHoi("Toyota");
  xe1.hienThiThongTin();

  XeHoi xe2 = XeHoi.xeDien("Tesla");
  xe2.hienThiThongTin();

  XeDien xeDien = XeDien("VinFast");
  xeDien.hienThiThongTin();



  print("\n========== EXERCISE 5 ==========");

  String? bietDanh;

  print("Biệt danh: ${bietDanh ?? "Duy Anh"}");

  bietDanh = "DA";

  print("Độ dài biệt danh: ${bietDanh!.length}");
  print("In hoa: ${bietDanh?.toUpperCase()}");

  print("\nStream dữ liệu:");

  Stream<int> streamSo = Stream.periodic(
    Duration(seconds: 1),
    (value) => value + 1,
  ).take(5);

  await for (int so in streamSo) {
    print(so);
  }



  Future<String> taiDuLieu() async {
    await Future.delayed(Duration(seconds: 2));

    return "Đã tải dữ liệu thành công";
  }

  print("\nĐang tải dữ liệu...");

  String duLieu = await taiDuLieu();

  print("Kết quả: $duLieu");
}