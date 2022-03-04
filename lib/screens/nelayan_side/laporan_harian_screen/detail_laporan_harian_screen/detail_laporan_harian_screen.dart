import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/detail_laporan_harian_screen/components/detail_laporan_harian_body.dart';

class DetailLaporanHarianScreen extends StatelessWidget {
  const DetailLaporanHarianScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Laporan Harian'),
      ),
      body: DetailLaporanHarianBody(),
    );
  }
}
