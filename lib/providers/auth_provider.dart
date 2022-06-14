import 'dart:io';

import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

class AuthProvider with ChangeNotifier {
  final loginState = GetStorage();

  UserModel _user = UserModel();

  UserModel get user => _user;

  List<UserModel> _listUser = [];

  List<UserModel> get listUser => _listUser;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String noKtp,
    required String name,
    required String noTelp,
    required String password,
    required String role,
  }) async {
    try {
      UserModel user = await AuthServices().register(
        noKtp: noKtp,
        name: name,
        noTelp: noTelp,
        password: password,
        role: role,
      );

      loginState.write('token', user.token);

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> loginNelayan({
    required String noTelp,
    required String password,
  }) async {
    try {
      UserModel user = await AuthServices().login(
        noTelp: noTelp,
        password: password,
      );

      loginState.write('token', user.token);

      if (user.role == 'costumer') {
        await AuthServices().logout();
        return false;
      } else {
        _user = user;

        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> loginCostumer({
    required String noTelp,
    required String password,
  }) async {
    try {
      UserModel user = await AuthServices().login(
        noTelp: noTelp,
        password: password,
      );

      loginState.write('token', user.token);

      if (user.role == 'nelayan') {
        await AuthServices().logout();
        return false;
      } else {
        _user = user;
        return true;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateProfile(
    String avatarOld, {
    required String name,
    required String noTelp,
    required String alamat,
    required File avatar,
  }) async {
    try {
      UserModel user = await AuthServices().updateProfile(
        avatarOld,
        name: name,
        noTelp: noTelp,
        alamat: alamat,
        avatar: avatar,
      );

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateAlamat({
    required String name,
    required String noTelp,
    required String alamat,
  }) async {
    try {
      UserModel user = await AuthServices().updateAlamat(
        name: name,
        noTelp: noTelp,
        alamat: alamat,
      );

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> getUser() async {
    try {
      UserModel user = await AuthServices().getUser();

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      bool isLogout = await AuthServices().logout();

      loginState.write('token', '');

      return isLogout;
    } catch (e) {
      return false;
    }
  }

  Future<void> getWithRole() async {
    try {
      List<UserModel> listUser = await AuthServices().getWithRole();

      _listUser = listUser;
    } catch (e) {
      print(e);
    }
  }
}
