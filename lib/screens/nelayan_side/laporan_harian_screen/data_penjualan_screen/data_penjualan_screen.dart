import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/data_penjualan_screen/components/data_penjualan_body.dart';

class DataPenjualanScreen extends StatelessWidget {
  const DataPenjualanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penjualan'),
      ),
      body: const DataPenjualanBody(),
    );
  }
}
