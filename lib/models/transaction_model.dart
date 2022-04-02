import 'package:flutter_ruang_nelayan/models/cart_model.dart';
import 'package:flutter_ruang_nelayan/models/user_model.dart';

class TransactionModel {
  int? id, idUsers, idJasaPengantaran;

  String? alamat, pembayaran, status;

  double? totalPembayaran, ongkosKirim, totalJasa;

  List<CartModel>? cartModel;

  UserModel? user;

  DateTime? createdAt, updatedAt;

  TransactionModel({
    this.id,
    this.idUsers,
    this.idJasaPengantaran,
    this.alamat,
    this.pembayaran,
    this.status,
    this.totalPembayaran,
    this.ongkosKirim,
    this.totalJasa,
    this.cartModel,
    this.createdAt,
    this.updatedAt,
  });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUsers = json['id_users'];
    idJasaPengantaran = json['id_jasa_pengantaran'];
    alamat = json['alamat'];
    pembayaran = json['pembayaran'];
    totalPembayaran = double.parse(json['total_pembayaran'].toString());
    ongkosKirim = double.parse(json['ongkos_kirim'].toString());
    totalJasa = double.parse(json['total_jasa'].toString());
    status = json['status'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    user = UserModel.fromJson(json['user']);

    cartModel = json['items']
        .map<CartModel>((item) => CartModel.fromJson(item))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_users': idUsers,
      'id_jasa_pengantaran': idJasaPengantaran,
      'alamat': alamat,
      'pembayaran': pembayaran,
      'total_pembayaran': totalPembayaran,
      'ongkos_kirim': ongkosKirim,
      'total_jasa': totalJasa,
      'status': status,
      'created_at': createdAt,
      'updatedAt': updatedAt,
      'user': user!.toJson(),
      'items': cartModel!.map((items) => items.toJson()).toList(),
    };
  }
}
