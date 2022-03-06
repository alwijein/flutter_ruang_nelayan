import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/components/konfirmasi_pesanan_body.dart';

class KonfirmasiPesananScreen extends StatelessWidget {
  const KonfirmasiPesananScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Pesanan'),
      ),
      body: KonfirmasiPesananBody(),
    );
  }
}
