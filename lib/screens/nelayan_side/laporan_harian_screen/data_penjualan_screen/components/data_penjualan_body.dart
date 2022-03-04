import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/components/profile_image.dart';

class DataPenjualanBody extends StatelessWidget {
  const DataPenjualanBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          getPropertionateScreenWidht(24),
        ),
        child: Column(
          children: [
            ProfileImage(
              img: 'assets/images/ikan_01.png',
              name: 'Sutono',
            ),
            Divider(
              thickness: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
