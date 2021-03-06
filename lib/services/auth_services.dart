part of 'services.dart';

class AuthServices {
  var baseUrl = baseUrlName;

  final loginState = GetStorage();

  Future<UserModel> register({
    required String noKtp,
    required String name,
    required String noTelp,
    required String password,
    required String role,
  }) async {
    var url = Uri.parse("$baseUrl/register");

    var headers = {'Content-Type': 'application/json'};

    var body = jsonEncode({
      'nik_ktp': noKtp,
      'name': name,
      'no_hp': noTelp,
      'password': password,
      'role': role,
      'avatar':
          'https://firebasestorage.googleapis.com/v0/b/ruang-nelayan.appspot.com/o/Hasil%20Tangkapan%2FFoto%20Profile%2Fdefault_person.png?alt=media&token=83a18cd2-2f2d-4f2a-9427-1ec1aa1dcb0e',
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

  Future<UserModel> updateProfile(
    String avatarOld, {
    required String name,
    required String noTelp,
    required String alamat,
    required File avatar,
  }) async {
    String fileName = basename(avatar.path);
    String imageUrl = avatarOld;
    if (fileName.isNotEmpty) {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('Foto Profile')
          .child(fileName);

      firebase_storage.UploadTask uploadTask = ref.putFile(avatar);

      firebase_storage.TaskSnapshot snapshot =
          await uploadTask.whenComplete(() => null);

      imageUrl = await ref.getDownloadURL();
    }
    var url = Uri.parse("$baseUrl/user");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': loginState.read('token').toString(),
    };

    var body = jsonEncode({
      'name': name,
      'no_hp': noTelp,
      'alamat': alamat,
      'avatar': imageUrl,
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

  Future<UserModel> updateAlamat({
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

  Future<List<UserModel>> getWithRole() async {
    Uri url = Uri.parse("$baseUrl/get-all?role=costumer");
    if (loginState.read('role').toString() != 'costumer') {
      url = Uri.parse("$baseUrl/get-all?role=costumer");
    } else if (loginState.read('role').toString() != 'nelayan') {
      url = Uri.parse("$baseUrl/get-all?role=nelayan");
    }

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': loginState.read('token').toString(),
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      List<UserModel> userModel = [];

      for (var item in data) {
        userModel.add(UserModel.fromJson(item));
      }

      print('success');

      return userModel;
    } else {
      throw Exception('Data Gagal Diambil');
    }
  }
}
