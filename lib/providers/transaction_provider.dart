import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/cart_model.dart';
import 'package:flutter_ruang_nelayan/models/transaction_model.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> _transactionModel = [];

  List<TransactionModel> get transactionModel => _transactionModel;

  set transactionModel(List<TransactionModel> transactionModel) {
    _transactionModel = transactionModel;
    notifyListeners();
  }

  Future<bool> checkout(
    List<CartModel> carts,
    int idNelayan,
    double totalPrice,
    String? alamat,
    double totalJasa,
    double ongkosKirim,
    int jasaPengantaran,
  ) async {
    try {
      if (await TransactionServices().checkout(
        carts,
        idNelayan,
        totalPrice,
        alamat ?? 'Makassar',
        totalJasa,
        ongkosKirim,
        jasaPengantaran,
      )) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> getTransaction(String status) async {
    try {
      List<TransactionModel> transactionModel =
          await TransactionServices().getTransaction(status);
      _transactionModel = transactionModel;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> confirmStatus({
    required int id,
  }) async {
    try {
      print('Succcccccccccessss===========-');

      bool user = await TransactionServices().confirmStatus(
        id,
      );

      print("ini user na user");

      return true;
    } catch (e) {
      print("Errornya = $e");
      return false;
    }
  }
}
