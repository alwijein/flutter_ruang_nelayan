import 'package:get/get.dart';

class StateController extends GetxController {
  var isEditProfile = false.obs;
  var titleEditProfile = "Edit Profile".obs;

  var loading = false.obs;

  var isAmbilSendiri = true.obs;

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
