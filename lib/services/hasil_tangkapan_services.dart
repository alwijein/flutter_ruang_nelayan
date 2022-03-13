part of 'services.dart';

class HasilTangkapanServices {
  var baseUrl = 'http://10.153.209.188:8000/api';

  Future<HasilTangkapanModel> getHasilTangkapan() async {
    var url = Uri.parse("$baseUrl/hasil-tangkapan");

    var headers = {
      'Content-Type': 'application/json',
    };

    var response = await http.get(
      url,
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      HasilTangkapanModel hasilTangkapanModel =
          HasilTangkapanModel.fromJson(data);

      print('success');

      return hasilTangkapanModel;
    } else {
      throw Exception('Data Gagal Diambil');
    }
  }
}
