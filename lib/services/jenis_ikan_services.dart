part of 'services.dart';

class JenisIkanServices {
  var baseUrl = baseUrlName;
  final loginState = GetStorage();

  Future<List<JenisIkanModel>> getJenisIkan() async {
    var url = Uri.parse("$baseUrl/jenis-ikan");

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

      List<JenisIkanModel> jenisIkan = [];

      for (var item in data) {
        jenisIkan.add(JenisIkanModel.fromJson(item));
      }

      print('success');

      return jenisIkan;
    } else {
      throw Exception('Data Gagal Diambil');
    }
  }
}
