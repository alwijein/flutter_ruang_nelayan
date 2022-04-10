import 'dart:io';

import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';

class HasilTangkapanProvider with ChangeNotifier {
  List<HasilTangkapanModel> _hasilTangkapan = [];

  List<HasilTangkapanModel> get hasilTangkapan => _hasilTangkapan;

  set hasilTangkapan(List<HasilTangkapanModel> hasilTangkapan) {
    _hasilTangkapan = hasilTangkapan;
    notifyListeners();
  }

  Future<bool> tambahHasilTangkapan({
    required int idUsers,
    required String namaIkan,
    required int idJenisIkan,
    required int jumlah,
    required double harga,
    required File gambar,
    required int idJasaPengerjaanIkan,
  }) async {
    try {
      print('Succcccccccccessss===========-');
      await HasilTangkapanServices().tambahHasilTangkapan(
        idUsers: idUsers,
        namaIkan: namaIkan,
        idJenisIkan: idJenisIkan,
        jumlah: jumlah,
        harga: harga,
        gambar: gambar,
        idJasaPengerjaanIkan: idJasaPengerjaanIkan,
      );

      return true;
    } catch (e) {
      print("Errornya = $e");
      return false;
    }
  }

  Future<bool> updateHasilTangkapan({
    required int id,
    required bool isEdit,
    required int idUsers,
    required String namaIkan,
    required int idJenisIkan,
    required int jumlah,
    required double harga,
    required File gambar,
    required int idJasaPengerjaanIkan,
  }) async {
    try {
      print('Succcccccccccessss===========-');
      await HasilTangkapanServices().updateHasilTangkapan(
        id: id,
        isEdit: isEdit,
        idUsers: idUsers,
        namaIkan: namaIkan,
        idJenisIkan: idJenisIkan,
        jumlah: jumlah,
        harga: harga,
        gambar: gambar,
        idJasaPengerjaanIkan: idJasaPengerjaanIkan,
      );

      return true;
    } catch (e) {
      print("Errornya = $e");
      return false;
    }
  }

  Future<void> getHasilTangkapan(int idUsers) async {
    try {
      List<HasilTangkapanModel> hasilTangkapan =
          await HasilTangkapanServices().getHasilTangkapan(idUsers);
      _hasilTangkapan = hasilTangkapan;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllHasilTangkapan() async {
    try {
      List<HasilTangkapanModel> hasilTangkapan =
          await HasilTangkapanServices().getAllHasilTangkapan();
      _hasilTangkapan = hasilTangkapan;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getNamaIkan(String namaIkan) async {
    try {
      List<HasilTangkapanModel> hasilTangkapan =
          await HasilTangkapanServices().getNamaIkan(namaIkan);

      print('sucesss');
      _hasilTangkapan = hasilTangkapan;
    } catch (e) {
      print(e);
    }
  }

  Future<void> getWithDate(String createdAt) async {
    try {
      List<HasilTangkapanModel> hasilTangkapan =
          await HasilTangkapanServices().getWithDate(createdAt);

      print('sucesss');
      _hasilTangkapan = hasilTangkapan;
    } catch (e) {
      print(e);
    }
  }
}
