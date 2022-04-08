import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/costumer_side/notifikasi_screen/components/notifikasi_body.dart';

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifikasi'),
      ),
      body: NotifikasiBody(),
    );
  }
}
