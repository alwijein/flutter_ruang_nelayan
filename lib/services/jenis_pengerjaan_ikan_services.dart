part of 'services.dart';

class JenisPengerjaanIkanServices {
  var baseUrl = baseUrlName;
  final loginState = GetStorage();

  Future<List<JasaPengerjaanModel>> getJenisPengerjaanIkan() async {
    var url = Uri.parse("$baseUrl/jenis-pengerjaan-ikan");

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

      List<JasaPengerjaanModel> jenisPengerjaanIkan = [];

      for (var item in data) {
        jenisPengerjaanIkan.add(JasaPengerjaanModel.fromJson(item));
      }

      print('success');

      return jenisPengerjaanIkan;
    } else {
      throw Exception('Data Gagal Diambil');
    }
  }
}
