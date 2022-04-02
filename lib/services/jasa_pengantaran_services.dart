part of 'services.dart';

class JasaPengantaranServices {
  var baseUrl = baseUrlName;
  final loginState = GetStorage();

  Future<List<JasaPengantaranModel>> getJasaPengantaran() async {
    var url = Uri.parse("$baseUrl/jasa-pengantaran");

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

      List<JasaPengantaranModel> jasaPengantaran = [];

      for (var item in data) {
        jasaPengantaran.add(JasaPengantaranModel.fromJson(item));
      }

      print('success');

      return jasaPengantaran;
    } else {
      throw Exception('Data Gagal Diambil');
    }
  }
}
