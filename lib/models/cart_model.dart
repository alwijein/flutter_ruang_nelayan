import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';

class CartModel {
  int? id;
  HasilTangkapanModel? hasilTangkapanModel;
  int? quantity;

  CartModel({
    this.id,
    this.hasilTangkapanModel,
    this.quantity,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hasilTangkapanModel = HasilTangkapanModel.fromJson(json['hasil_tangkapan']);
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hasil_tangkapan': hasilTangkapanModel!.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    return hasilTangkapanModel!.harga! * quantity!;
  }
}
