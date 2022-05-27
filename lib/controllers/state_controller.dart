import 'dart:io';

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
}
