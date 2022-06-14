part of 'services.dart';

class TipeIkanServices {
  var baseUrl = baseUrlName;

  final loginState = GetStorage();

  Future<List<TipeIkanModel>> ikanAirTawar() async {
    var url = Uri.parse("$baseUrl/ikan-air-tawar/lihat");

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

      List<TipeIkanModel> hasilTangkapan = [];

      for (var item in data) {
        hasilTangkapan.add(TipeIkanModel.fromJson(item));
      }

      print('success');

      return hasilTangkapan;
    } else {
      throw Exception('Data Gagal Diambil');
    }
  }

  Future<List<TipeIkanModel>> ikanAirLaut() async {
    var url = Uri.parse("$baseUrl/ikan-air-laut/lihat");

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

      List<TipeIkanModel> hasilTangkapan = [];

      for (var item in data) {
        hasilTangkapan.add(TipeIkanModel.fromJson(item));
      }

      print('success');

      return hasilTangkapan;
    } else {
      throw Exception('Data Gagal Diambil');
    }
  }
}
