import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLogin = false.obs;

  loginState() => isLogin.value = true;
}
