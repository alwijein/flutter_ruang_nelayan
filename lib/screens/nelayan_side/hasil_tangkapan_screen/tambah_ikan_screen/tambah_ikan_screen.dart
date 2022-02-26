import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/hasil_tangkapan_screen/tambah_ikan_screen/components/tambah_ikan_body.dart';

class TambahIkanScreen extends StatelessWidget {
  const TambahIkanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Tangkapan'),
      ),
      body: TambahIkanBody(),
    );
  }
}
