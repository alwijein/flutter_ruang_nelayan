part of 'services.dart';

class AuthServices {
  var baseUrl = 'http://10.153.221.132:8000/api';

  final loginState = GetStorage();

  Future<UserModel> register(
      {required String noKtp,
      required String name,
      required String noTelp,
      required String password}) async {
    var url = Uri.parse("$baseUrl/register");

    var headers = {'Content-Type': 'application/json'};

    var body = jsonEncode({
      'nik_ktp': noKtp,
      'name': name,
      'no_hp': noTelp,
      'password': password,
      // 'alamat': '',
      // 'avatar': 'https://ui-avatars.com/api/?name',
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      UserModel userModel = UserModel.fromJson(data['0']);

      userModel.token = 'Bearer ' + data['access_token'];

      return userModel;
    } else {
      throw Exception('Register Gagal');
    }
  }

  Future<UserModel> login({
    required String noTelp,
    required String password,
  }) async {
    var url = Uri.parse("$baseUrl/login");

    var headers = {'Content-Type': 'application/json'};

    var body = jsonEncode({
      'no_hp': noTelp,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      UserModel userModel = UserModel.fromJson(data['user']);

      userModel.token = 'Bearer ' + data['access_token'];
      print('success');

      return userModel;
    } else {
      throw Exception('Login Gagal');
    }
  }

  Future<UserModel> updateProfile({
    required String name,
    required String noTelp,
    required String alamat,
  }) async {
    var url = Uri.parse("$baseUrl/user");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': loginState.read('token').toString(),
    };

    var body = jsonEncode({
      'name': name,
      'no_hp': noTelp,
      'alamat': alamat,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print('iniiii' + loginState.read('token').toString());

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      UserModel userModel = UserModel.fromJson(data);

      print('success');

      return userModel;
    } else {
      throw Exception('Update Gagal');
    }
  }

  Future<UserModel> getUser() async {
    var url = Uri.parse("$baseUrl/user");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': loginState.read('token').toString(),
    };

    var response = await http.get(
      url,
      headers: headers,
    );
    print('iniiii' + loginState.read('token').toString());

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      UserModel userModel = UserModel.fromJson(data);

      print('success');

      return userModel;
    } else {
      throw Exception('User Gagal Diambil');
    }
  }

  Future<bool> logout() async {
    var url = Uri.parse("$baseUrl/logout");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': loginState.read('token').toString(),
    };

    var response = await http.get(
      url,
      headers: headers,
    );
    print('iniiii' + loginState.read('token').toString());

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      bool isLogout = data;

      print('success');

      return isLogout;
    } else {
      throw Exception('User Gagal Diambil');
    }
  }
}
