import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/components/laporan_harian_body.dart';

class LaporanHarianScreen extends StatelessWidget {
  const LaporanHarianScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const Scaffold(
      body: LaporanHarianBody(),
    );
  }
}
