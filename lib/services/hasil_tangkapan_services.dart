part of 'services.dart';

class HasilTangkapanServices {
  var baseUrl = 'http://10.153.221.132:8000/api';

  final loginState = GetStorage();

  Future<List<HasilTangkapanModel>> getHasilTangkapan(int idUsers) async {
    var url = Uri.parse("$baseUrl/hasil-tangkapan?id_users=$idUsers");

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
      var data = jsonDecode(response.body)['data']['data'];

      List<HasilTangkapanModel> hasilTangkapan = [];

      for (var item in data) {
        hasilTangkapan.add(HasilTangkapanModel.fromJson(item));
      }

      print('success');

      return hasilTangkapan;
    } else {
      throw Exception('Data Gagal Diambil');
    }
  }

  Future<HasilTangkapanModel?> tambahHasilTangkapan(
    // int idUsers,
    // String namaIkan,
    // int idJenisIkan,
    // int jumlah,
    // int harga,
    File gambar,
    // int idJasaPengerjaanIkan,
  ) async {
    String fileName = basename(gambar.path);

    firebase_storage.Reference ref =
        firebase_storage.FirebaseStorage.instance.ref().child(fileName);

    firebase_storage.UploadTask uploadTask = ref.putFile(gambar);

    firebase_storage.TaskSnapshot snapshot =
        await uploadTask.whenComplete(() => null);

    var url = Uri.parse("$baseUrl/hasil-tangkapan/tambah-ikan");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': loginState.read('token').toString(),
    };

    // var body = jsonEncode({
    //   'id_users': idUsers,
    //   'nama_ikan': namaIkan,
    //   'id_jenis_ikan': idJenisIkan,
    //   'jumlah': jumlah,
    //   'harga': harga,
    //   'gambar': gambar,
    //   'idJasaPengerjaanIkan': idJasaPengerjaanIkan,
    // });

    // var response = await http.post(
    //   url,
    //   body: body,
    //   headers: headers,
    // );

    // print(response.body);
    print('Success' + fileName);

    // if (response.statusCode == 200) {
    //   var data = jsonDecode(response.body)['data']['data'];

    //   List<HasilTangkapanModel> hasilTangkapan = [];

    //   for (var item in data) {
    //     hasilTangkapan.add(HasilTangkapanModel.fromJson(item));
    //   }

    //   print('success');

    //   return hasilTangkapan;
    // } else {
    //   throw Exception('Data Gagal Diambil');
    // }
  }
}
