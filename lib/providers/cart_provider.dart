import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/cart_model.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';
import 'package:flutter_ruang_nelayan/models/jasa_pengerjaan_model.dart';
import 'package:get/get.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  List<JasaPengerjaanModel> _jasaPengerjaan = [];

  List<JasaPengerjaanModel> get jasaPengerjaan => _jasaPengerjaan;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  set jasaPengerjaan(List<JasaPengerjaanModel> jasaPengerjaan) {
    _jasaPengerjaan = jasaPengerjaan;
    notifyListeners();
  }

  addCart(HasilTangkapanModel hasilTangkapan) {
    if (productExist(hasilTangkapan)) {
      int index = _carts.indexWhere(
          (element) => element.hasilTangkapanModel!.id == hasilTangkapan.id);
      _carts[index].quantity = _carts[index].quantity! + 1;
      Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Ikan Berhasil Dimasukkan Ke Keranjang',
          textConfirm: 'Lihat Keranjang',
          confirmTextColor: kWhiteTextColor,
          onConfirm: () {
            Get.offNamed('/cart');
          });
    } else {
      if (_carts.isEmpty) {
        _carts.add(
          CartModel(
            id: _carts.length,
            hasilTangkapanModel: hasilTangkapan,
            quantity: 1,
          ),
        );
        Get.defaultDialog(
            title: 'Berhasil',
            middleText: 'Ikan Berhasil Dimasukkan Ke Keranjang',
            textConfirm: 'Lihat Keranjang',
            confirmTextColor: kWhiteTextColor,
            onConfirm: () {
              Get.offNamed('/cart');
            });
      } else {
        Get.defaultDialog(
            title: 'Gagal',
            middleText:
                'Anda harus menyelesaikan pembelian ikan di keranjang sebelum membeli ikan di nelayan lain!',
            textConfirm: 'Lihat Keranjang',
            confirmTextColor: kWhiteTextColor,
            onConfirm: () {
              Get.offNamed('/cart');
            });
      }
    }

    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    if (_carts[id].quantity! < _carts[id].hasilTangkapanModel!.jumlah!) {
      _carts[id].quantity = _carts[id].quantity! + 1;
    }
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity = _carts[id].quantity! - 1;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  addOption(int id, List<String> index) {
    resetJasa();
    for (var data in _carts[id].hasilTangkapanModel!.jenisPengerjaanIkan!) {
      for (var indexing in index) {
        if (data.jenisPengerjaan == indexing) {
          _jasaPengerjaan.add(data);
        }
      }
    }
    notifyListeners();
  }

  resetJasa() {
    _jasaPengerjaan = [];
    notifyListeners();
  }

  getPengerjaanIkan() {
    String jasa = '';
    for (var data in jasaPengerjaan) {
      jasa += data.jenisPengerjaan.toString() + ',';
    }

    return jasa;
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity!;
    }
    return total;
  }

  totalKg() {
    int jumlah = 0;
    for (var item in _carts) {
      jumlah += item.quantity!;
    }
    return jumlah;
  }

  totalPrice() {
    double total = 0;
    for (var item in _carts) {
      total += (item.quantity! * item.hasilTangkapanModel!.harga!);
    }
    return total;
  }

  totalJasa() {
    double total = 0;
    for (var item in _jasaPengerjaan) {
      total += item.biaya ?? 0;
    }
    return total;
  }

  getOptions(int id) {
    List<JasaPengerjaanModel> options = [];

    for (int i = 0;
        i < _carts[id].hasilTangkapanModel!.jenisPengerjaanIkan!.length;
        i++) {
      options.add(_carts[id].hasilTangkapanModel!.jenisPengerjaanIkan![i]);
    }

    return options;
  }

  productExist(HasilTangkapanModel hasilTangkapan) {
    if (_carts.indexWhere((element) =>
            element.hasilTangkapanModel!.id == hasilTangkapan.id) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
