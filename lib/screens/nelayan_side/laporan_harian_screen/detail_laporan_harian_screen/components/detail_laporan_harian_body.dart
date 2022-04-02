import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';
import 'package:flutter_ruang_nelayan/providers/hasil_tangkapan_provider.dart';
import 'package:flutter_ruang_nelayan/providers/transaction_provider.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/detail_laporan_harian_screen/components/data_hasil_tangkapan.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/detail_laporan_harian_screen/components/data_penjualan.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/detail_laporan_harian_screen/components/header.dart';
import 'package:get/get.dart';

class DetailLaporanHarianBody extends StatelessWidget {
  const DetailLaporanHarianBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HasilTangkapanProvider hasilTangkapanProvider =
        Provider.of<HasilTangkapanProvider>(context);

    // method for count jumlah ikan
    int jumlahIkan = 0;
    double totalHarga = 0;
    for (int i = 0; i < hasilTangkapanProvider.hasilTangkapan.length; i++) {
      jumlahIkan += hasilTangkapanProvider.hasilTangkapan[i].jumlah!;
      totalHarga += hasilTangkapanProvider.hasilTangkapan[i].harga!;
    }

    var date = Get.arguments['created_at'];
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            getPropertionateScreenWidht(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                date: FormatDate.formatDateWithTime(DateTime.parse(date)),
              ),
              Divider(
                thickness: 2.0,
              ),
              DataHasilTangkapan(
                jumlahIkan: jumlahIkan,
                totalHarga: totalHarga,
              ),
              Divider(
                thickness: 2.0,
              ),
              DataPenjualan(),
            ],
          ),
        ),
      ),
    );
  }
}
