import 'dart:convert';

import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/providers/cart_provider.dart';
import 'package:flutter_ruang_nelayan/providers/transaction_provider.dart';
import 'dart:io' show Platform;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get.dart';

class SnapScreen extends StatefulWidget {
  @override
  _SnapScreenState createState() => _SnapScreenState();
}

class _SnapScreenState extends State<SnapScreen> {
  WebViewController? webViewController;
  bool _isLoading = false;

  var token = Get.arguments[0]['token'];
  var carts = Get.arguments[1]['carts'];
  var total_harga = Get.arguments[2]['total_harga'];
  var alamat = Get.arguments[3]['alamat'];
  var total_jasa = Get.arguments[4]['total_jasa'];
  var ongkos_kirim = Get.arguments[5]['ongkos_kirim'];
  var id_jasa_pengantaran = Get.arguments[6]['id_jasa_pengantaran'];
  var id_nelayan = Get.arguments[7]['id_nelayan'];

  @override
  void initState() {
    _isLoading = true;
    super.initState();
  }

  @override
  void didUpdateWidget(SnapScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PAYMENT',
          style: primaryTextStyle,
        ),
        elevation: 2,
      ),
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: Stack(
          children: <Widget>[
            WebView(
              initialUrl: '',
              javascriptMode: JavascriptMode.unrestricted,
              gestureNavigationEnabled: true,
              javascriptChannels: <JavascriptChannel>[
                JavascriptChannel(
                  name: 'Print',
                  onMessageReceived: (JavascriptMessage receiver) {
                    print('==========>>>>>>>>>>>>>> BEGIN');
                    print(receiver.message);
                    if (receiver.message != null ||
                        receiver.message != 'undefined') {
                      if (receiver.message == 'close') {
                        Navigator.pop(context);
                      } else {
                        _handleResponse(receiver.message);
                      }
                    }
                    print('==========>>>>>>>>>>>>>> END');
                  },
                ),
                JavascriptChannel(
                  name: 'Android',
                  onMessageReceived: (JavascriptMessage receiver) {
                    print('==========>>>>>>>>>>>>>> BEGIN');
                    print(receiver.message);
                    if (Platform.isAndroid) {
                      if (receiver.message != null ||
                          receiver.message != 'undefined') {
                        if (receiver.message == 'close') {
                          Navigator.pop(context);
                        } else {
                          _handleResponse(receiver.message);
                        }
                      }
                    }
                    print('==========>>>>>>>>>>>>>> END');
                  },
                ),
              ].toSet(),
              onWebViewCreated: (_controller) {
                webViewController = _controller;
                _loadHtmlFromAssets();
              },
              onPageFinished: (strURL) {
                setState(() {
                  _isLoading = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  _loadHtmlFromAssets() {
    webViewController!.loadUrl(Uri.dataFromString('''
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- @TODO: replace SET_YOUR_CLIENT_KEY_HERE with your client key -->
        <script type="text/javascript"
          src="https://app.sandbox.midtrans.com/snap/snap.js"
          data-client-key="SB-Mid-client-ATcvntq6tOnAgtBn"></script>
        <!-- Note: replace with src="https://app.midtrans.com/snap/snap.js" for Production environment -->
      </head>
    
      <body onload="setTimeout(function(){pay()}, 1000)">
        <script type="text/javascript">
            function pay() {
                snap.pay('$token', {
                  // Optional
                  onSuccess: function(result) {
                    Android.postMessage('ok');
                    Print.postMessage(result);
                  },
                  // Optional
                  onPending: function(result) {
                    Android.postMessage('pending');
                    Print.postMessage(result);
                  },
                  // Optional
                  onError: function(result) {
                    Android.postMessage('error');
                    Print.postMessage(result);
                  },
                  onClose: function() {
                    Android.postMessage('close');
                    Print.postMessage('close');
                  }
                });
            }
        </script>
      </body>
    ''', mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  _handleResponse(message) {
    try {
      var title, desc;
      Midtrans? midtrans;
      if (Platform.isAndroid) {
        switch (message) {
          case 'ok':
            midtrans = Midtrans(MIDTRANS_PAYMENT_TYPE.bank_transfer,
                MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_200);
            break;
          case 'pending':
            midtrans = Midtrans(MIDTRANS_PAYMENT_TYPE.bank_transfer,
                MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_201);
            break;
          case 'error':
            midtrans = Midtrans(MIDTRANS_PAYMENT_TYPE.bank_transfer,
                MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_202);
            break;
        }
      } else {
        midtrans = Midtrans.fromString(message);
      }
      var result = midtrans!.getResult();
      title = result[0];
      desc = result[1];
      if (title.length == 0 && desc.length == 0)
        Get.snackbar('success', 'success');
      else
        _showConfirmDialog(title, desc);
    } catch (e) {
      Get.snackbar('gagal', 'gagal');
    }
  }

  void _showConfirmDialog(title, desc) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        TransactionProvider transactionProvider =
            Provider.of<TransactionProvider>(context);
        CartProvider cartProvider = Provider.of<CartProvider>(context);
        return Container(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: primaryTextStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  desc,
                  style: primaryTextStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                DefaultButton(
                  text: Text(
                    'Lanjutkan',
                    style: whiteTextStyle,
                  ),
                  isInfinity: false,
                  press: () async {
                    print([
                      carts,
                      total_harga,
                      alamat,
                      total_jasa,
                      ongkos_kirim,
                      id_jasa_pengantaran,
                    ]);
                    if (await transactionProvider.checkout(
                      carts,
                      int.parse(id_nelayan.toString()),
                      total_harga,
                      alamat,
                      total_jasa,
                      ongkos_kirim,
                      id_jasa_pengantaran,
                    )) {
                      cartProvider.carts = [];
                      Get.offNamed('home-costumer');
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

enum MIDTRANS_PAYMENT_TYPE {
  credit_card,
  bca_klikpay,
  bca_klikbca,
  bri_epay,
  telkomsel_cash,
  bank_transfer,
  echannel,
  indosat_dompetku,
  cstore
}

const Map<String, MIDTRANS_PAYMENT_TYPE> MidtransPaymentTypeMap = {
  'credit_card': MIDTRANS_PAYMENT_TYPE.credit_card,
  'bca_klikpay': MIDTRANS_PAYMENT_TYPE.bca_klikpay,
  'bca_klikbca': MIDTRANS_PAYMENT_TYPE.bca_klikbca,
  'bri_epay': MIDTRANS_PAYMENT_TYPE.bri_epay,
  'telkomsel_cash': MIDTRANS_PAYMENT_TYPE.telkomsel_cash,
  'bank_transfer': MIDTRANS_PAYMENT_TYPE.bank_transfer,
  'echannel': MIDTRANS_PAYMENT_TYPE.echannel,
  'indosat_dompetku': MIDTRANS_PAYMENT_TYPE.indosat_dompetku,
  'cstore': MIDTRANS_PAYMENT_TYPE.cstore,
};

enum MIDTRANS_STATUS_CODE {
  MIDTRANS_STATUS_CODE_200,
  MIDTRANS_STATUS_CODE_201,
  MIDTRANS_STATUS_CODE_202,
  MIDTRANS_STATUS_CODE_300,
  MIDTRANS_STATUS_CODE_400,
  MIDTRANS_STATUS_CODE_401,
  MIDTRANS_STATUS_CODE_402,
  MIDTRANS_STATUS_CODE_403,
  MIDTRANS_STATUS_CODE_404,
  MIDTRANS_STATUS_CODE_405,
  MIDTRANS_STATUS_CODE_406,
  MIDTRANS_STATUS_CODE_407,
  MIDTRANS_STATUS_CODE_408,
  MIDTRANS_STATUS_CODE_409,
  MIDTRANS_STATUS_CODE_410,
  MIDTRANS_STATUS_CODE_411,
  MIDTRANS_STATUS_CODE_412,
  MIDTRANS_STATUS_CODE_413,
  MIDTRANS_STATUS_CODE_500,
  MIDTRANS_STATUS_CODE_501,
  MIDTRANS_STATUS_CODE_502,
  MIDTRANS_STATUS_CODE_503,
  MIDTRANS_STATUS_CODE_504,
}

const Map<int, MIDTRANS_STATUS_CODE> MidtransStatusCodeMap = {
  200: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_200,
  201: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_201,
  202: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_202,
  300: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_300,
  400: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_400,
  401: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_401,
  402: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_402,
  403: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_403,
  404: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_404,
  405: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_405,
  406: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_406,
  407: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_407,
  408: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_408,
  409: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_409,
  410: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_410,
  411: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_411,
  412: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_412,
  413: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_413,
  500: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_500,
  501: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_501,
  502: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_502,
  503: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_503,
  504: MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_504,
};

class Midtrans {
  MIDTRANS_PAYMENT_TYPE? paymentType;
  MIDTRANS_STATUS_CODE? statusCode;

  Midtrans(MIDTRANS_PAYMENT_TYPE type, MIDTRANS_STATUS_CODE code) {
    paymentType = type;
    statusCode = code;
  }

  Midtrans.fromString(String message) {
    String? codeStr = RegExp(r'"status_code".*').stringMatch(message);
    int code = int.parse(
        RegExp(r'\d+;$').stringMatch(codeStr!)!.replaceAll(RegExp(r';'), ''));
    statusCode = MidtransStatusCodeMap[code];

    String? typeStr = RegExp(r'"payment_type".*').stringMatch(message);
    typeStr = RegExp(r'"?\w+"?;')
        .stringMatch(typeStr!)!
        .replaceAll(RegExp(r'[;"]'), '');
    paymentType = MidtransPaymentTypeMap[typeStr];
  }

  List<String> getResult() {
    String title = '', desc = '';
    switch (statusCode ?? '') {
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_200:
        title = 'Purchase successfully!';
        break;

      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_201:
        title = 'Purchase successfully!';

        if (paymentType == MIDTRANS_PAYMENT_TYPE.bank_transfer) {
          desc = 'You have 24 hours to send money.';
        }
        break;
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_202:
        title = 'Fraud detection!';
        desc = 'Your payment is denied.';
        break;
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_300:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_400:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_401:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_402:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_403:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_404:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_405:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_406:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_407:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_408:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_409:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_410:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_411:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_412:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_413:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_500:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_501:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_502:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_503:
      case MIDTRANS_STATUS_CODE.MIDTRANS_STATUS_CODE_504:
    }
    return [title, desc];
  }
}
