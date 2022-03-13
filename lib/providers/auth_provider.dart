import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

class AuthProvider with ChangeNotifier {
  final loginState = GetStorage();

  UserModel _user = UserModel();

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
      loginState.write('token', user.token);

      _user = user;
      return true;
    } catch (e) {
      print("Errornya = $e");
      return false;
    }
  }

  Future<bool> login({
    required String noTelp,
    required String password,
  }) async {
    try {
      print('Succcccccccccessss===========-');
      UserModel user = await AuthServices().login(
        noTelp: noTelp,
        password: password,
      );

      print("ini user na user");

      loginState.write('token', user.token);

      _user = user;
      return true;
    } catch (e) {
      print("Errornya = $e");
      return false;
    }
  }

  Future<bool> updateProfile({
    required String name,
    required String noTelp,
    required String alamat,
  }) async {
    try {
      print('Succcccccccccessss===========-');
      UserModel user = await AuthServices().updateProfile(
        name: name,
        noTelp: noTelp,
        alamat: alamat,
      );

      print("ini user na user");

      _user = user;
      return true;
    } catch (e) {
      print("Errornya = $e");
      return false;
    }
  }

  Future<bool> getUser() async {
    try {
      print('Succcccccccccessss===========-');
      UserModel user = await AuthServices().getUser();

      print("ini user na user");

      _user = user;
      return true;
    } catch (e) {
      print("Errornya = $e");
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      print('Succcccccccccessss===========-');
      bool isLogout = await AuthServices().logout();

      print("ini user na user");

      loginState.write('token', '');

      return isLogout;
    } catch (e) {
      print("Errornya = $e");
      return false;
    }
  }
}
