import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/proses_pemesanan_screen/components/proses_pemesanan_body.dart';

class ProsesPemesananScreen extends StatelessWidget {
  const ProsesPemesananScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ProsesPemesananBody(),
    );
  }
}
