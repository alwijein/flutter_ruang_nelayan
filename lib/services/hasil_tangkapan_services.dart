part of 'services.dart';

class HasilTangkapanServices {
  var baseUrl = baseUrlName;

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

  Future<List<HasilTangkapanModel>> getAllHasilTangkapan() async {
    var url = Uri.parse("$baseUrl/hasil-tangkapan");

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

  Future<List<HasilTangkapanModel>> getNamaIkan(String namaIkan) async {
    var url = Uri.parse("$baseUrl/hasil-tangkapan?nama_ikan=$namaIkan");

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

  Future<List<HasilTangkapanModel>> getWithDate(String created_at) async {
    var url = Uri.parse("$baseUrl/hasil-tangkapan?created_at=$created_at");

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
      {required int idUsers,
      required String namaIkan,
      required int idJenisIkan,
      required int jumlah,
      required double harga,
      required File gambar,
      required int idJasaPengerjaanIkan}) async {
    String fileName = basename(gambar.path);

    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('Hasil Tangkapan')
        .child(fileName);

    firebase_storage.UploadTask uploadTask = ref.putFile(gambar);

    firebase_storage.TaskSnapshot snapshot =
        await uploadTask.whenComplete(() => null);

    String imageUrl = await ref.getDownloadURL();

    var url = Uri.parse("$baseUrl/hasil-tangkapan/tambah-ikan");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': loginState.read('token').toString(),
    };

    var body = jsonEncode({
      'id_users': idUsers,
      'nama_ikan': namaIkan,
      'id_jenis_ikan': idJenisIkan,
      'jumlah': jumlah,
      'harga': harga,
      'gambar': imageUrl,
      'id_jasa_pengerjaan_ikan': idJasaPengerjaanIkan,
    });

    var response = await http.post(
      url,
      body: body,
      headers: headers,
    );

    print(response.body);
    print('ini urlnya = ' + imageUrl);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      HasilTangkapanModel hasilTangkapanModel =
          HasilTangkapanModel.fromJson(data['data']);

      print('success');

      return hasilTangkapanModel;
    } else {
      throw Exception('Data Gagal Diambil');
    }
  }
}
