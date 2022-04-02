part of 'services.dart';

class LaporanHarianServices {
  var baseUrl = baseUrlName;

  final loginState = GetStorage();

  Future<List<LaporanHarianModel>> getLaporanHarian() async {
    var url = Uri.parse("$baseUrl/laporan-harian");

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
      List data = jsonDecode(response.body)['data']['data'];

      List<LaporanHarianModel> laporanHarianModel = [];

      for (var item in data) {
        laporanHarianModel.add(LaporanHarianModel.fromJson(item));
      }

      print('success');

      return laporanHarianModel;
    } else {
      throw Exception('User Gagal Diambil');
    }
  }

  Future<bool> inputLaporan() async {
    var url = Uri.parse("$baseUrl/laporan-harian");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': loginState.read('token').toString(),
    };
    var body;

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data']['data'];
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout!');
    }
  }
}
