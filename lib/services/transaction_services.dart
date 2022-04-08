part of 'services.dart';

class TransactionServices {
  var baseUrl = baseUrlName;

  final loginState = GetStorage();

  Future<bool> checkout(
    List<CartModel> carts,
    int idNelayan,
    double totalPrice,
    String alamat,
    double totalJasa,
    double ongkosKirim,
    String pembayaran,
    int jasaPengantaran,
  ) async {
    var url = Uri.parse("$baseUrl/checkout");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': loginState.read('token').toString(),
    };
    var body = jsonEncode(
      {
        'alamat': alamat,
        'items': carts
            .map(
              (cart) => {
                'id': cart.hasilTangkapanModel!.id!,
                'quantity': cart.quantity,
              },
            )
            .toList(),
        'status': "PENDING",
        'pembayaran': pembayaran,
        'total_pembayaran': totalPrice,
        'total_jasa': totalJasa,
        'ongkos_kirim': ongkosKirim,
        'id_jasa_pengantaran': jasaPengantaran,
        'id_nelayan': idNelayan,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout!');
    }
  }

  Future<String> getToken(
    double totalHarga,
  ) async {
    var url = Uri.parse("$baseUrl/getToken");

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': loginState.read('token').toString(),
    };
    var body = jsonEncode(
      {
        'total_harga': totalHarga,
      },
    );

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      String token = '';
      return token = data['payment_token'];
    } else {
      throw Exception('Gagal Melakukan Checkout!');
    }
  }

  Future<List<TransactionModel>> getTransaction(String status) async {
    var url = Uri.parse("$baseUrl/transaction?status=$status");

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

      List<TransactionModel> transactionModel = [];

      for (var item in data) {
        transactionModel.add(TransactionModel.fromJson(item));
      }

      print('success');

      return transactionModel;
    } else {
      throw Exception('User Gagal Diambil');
    }
  }

  Future<List<TransactionModel>> getTransactionWithDate(
      String status, String created_at) async {
    var url =
        Uri.parse("$baseUrl/transaction?status=$status&created_at=$created_at");

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

      List<TransactionModel> transactionModel = [];

      for (var item in data) {
        transactionModel.add(TransactionModel.fromJson(item));
      }

      print('success');

      return transactionModel;
    } else {
      throw Exception('User Gagal Diambil');
    }
  }

  Future<List<TransactionModel>> getAllTransaction() async {
    var url = Uri.parse("$baseUrl/transaction");

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

      List<TransactionModel> transactionModel = [];

      for (var item in data) {
        transactionModel.add(TransactionModel.fromJson(item));
      }

      print('success');

      return transactionModel;
    } else {
      throw Exception('User Gagal Diambil');
    }
  }

  Future<bool> confirmStatus(
    int id,
  ) async {
    var url = Uri.parse("$baseUrl/confirm-status?id=$id");

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
      var data = jsonDecode(response.body)['data'];
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout!');
    }
  }
}
