import 'package:get/get.dart';

class StateController extends GetxController {
  var isEditProfile = false.obs;
  var titleEditProfile = "Edit Profile".obs;

  editProfile() {
    isEditProfile.value = !isEditProfile.value;
    if (isEditProfile.value == true) {
      titleEditProfile.value = "Batalkan";
    } else {
      titleEditProfile.value = "Edit Profile";
    }
  }
}
