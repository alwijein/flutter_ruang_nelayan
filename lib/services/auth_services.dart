part of 'services.dart';

class AuthServices {
  var baseUrl = 'http://192.168.1.84:8000/api';

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
      // 'avatar': '',
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

      userModel.token = 'Bearer ' + data['acces_token'];

      return userModel;
    } else {
      throw Exception('Register Failed');
    }
  }
}
