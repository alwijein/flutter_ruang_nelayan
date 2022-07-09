import 'dart:io';

import 'package:flutter_ruang_nelayan/models/cart_model.dart';
import 'package:get/get.dart';

class StateController extends GetxController {
  var isEditProfile = false.obs;
  var titleEditProfile = "Edit Profile".obs;

  var loading = false.obs;

  var isAmbilSendiri = true.obs;

  var file = File('').obs;

  void setFile(File file) {
    this.file.value = file;
  }

  // File getFile() {
  //   return this.file.value;
  // }

  void isReset() => isAmbilSendiri.value = true;

  void isLoading() => loading.value = true;

  void isNotLoading() => loading.value = false;

  editProfile() {
    isEditProfile.value = !isEditProfile.value;
    if (isEditProfile.value == true) {
      titleEditProfile.value = "Batalkan";
    } else {
      titleEditProfile.value = "Edit Profile";
    }
  }

  selectKurir() {
    isAmbilSendiri.value = !isAmbilSendiri.value;
  }

  // State for Jasa Ikan

  var jasaPengerjaanIkan = [].obs;
  CartModel cartModel = CartModel();
  var jasa = ''.obs;

  getTotalJasa() {}

  setJasa(List<String> index, CartModel carts) {
    for (var data in carts.hasilTangkapanModel!.jenisPengerjaanIkan!) {
      for (var indexing in index) {
        if (data.jenisPengerjaan == indexing) {
          // jasaPengerjaanIkan.hasilTangkapanModel[carts.id].jenisPengerjaanIkan.add(carts);
        }
        // cartModel.hasilTangkapanModel.jenisPengerjaanIkan
      }
    }
    setPengerjaanIkan(carts.id!);
  }

  setPengerjaanIkan(int id) {
    String jasa = '';
    for (var data
        in jasaPengerjaanIkan[id].hasilTangkapanModel.jenisPengerjaanIkan) {
      jasa += data.jenisPengerjaan;
    }

    this.jasa.value = jasa;
  }

  resetJasa(int id) {
    jasaPengerjaanIkan[id].hasilTangkapanModel.jenisPengerjaanIkan = [];
  }
}
