import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/user_model.dart';
import 'package:flutter/services.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {required String noKtp,
      required String name,
      required String noTelp,
      required String password}) async {
    try {
      print('Succcccccccccessss===========-');
      UserModel user = await AuthServices().register(
        noKtp: noKtp,
        name: name,
        noTelp: noTelp,
        password: password,
      );

      print("ini user na user $user");

      _user = user;
      return true;
    } catch (e) {
      print("Errornya = $e");
      return false;
    }
  }
}
