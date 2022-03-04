import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/detail_laporan_harian_screen/components/data_hasil_tangkapan.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/detail_laporan_harian_screen/components/data_penjualan.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/detail_laporan_harian_screen/components/header.dart';

class DetailLaporanHarianBody extends StatelessWidget {
  const DetailLaporanHarianBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          getPropertionateScreenWidht(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            Divider(
              thickness: 2.0,
            ),
            DataHasilTangkapan(),
            Divider(
              thickness: 2.0,
            ),
            DataPenjualan(),
          ],
        ),
      ),
    );
  }
}
