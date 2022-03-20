part of 'services.dart';

class IkanAirTawarSevices {
  var baseUrl = baseUrlName;

  final loginState = GetStorage();

  Future<List<IkanAirTawarModel>> getAll() async {
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

      List<IkanAirTawarModel> hasilTangkapan = [];

      for (var item in data) {
        hasilTangkapan.add(IkanAirTawarModel.fromJson(item));
      }

      print('success');

      return hasilTangkapan;
    } else {
      throw Exception('Data Gagal Diambil');
    }
  }
}
