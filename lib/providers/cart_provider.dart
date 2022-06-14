import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/cart_model.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(HasilTangkapanModel hasilTangkapan) {
    if (productExist(hasilTangkapan)) {
      int index = _carts.indexWhere(
          (element) => element.hasilTangkapanModel!.id == hasilTangkapan.id);
      _carts[index].quantity = _carts[index].quantity! + 1;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          hasilTangkapanModel: hasilTangkapan,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity = _carts[id].quantity! + 1;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity = _carts[id].quantity! - 1;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
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
      jumlah += item.hasilTangkapanModel!.jumlah!;
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
    for (var item in _carts) {
      total += item.hasilTangkapanModel!.jenisPengerjaanIkan!.biaya!;
    }
    return total;
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
