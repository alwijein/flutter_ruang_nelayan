import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/home_screen/components/card_menu.dart';
import 'package:get/get.dart';

class BodyMenu extends StatelessWidget {
  const BodyMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardMenu(
              image: 'assets/images/illustration_data_nelayan.svg',
              title: 'Data Nelayan',
              color1: kColorLightkBlue,
              color2: kColorDarkBlue,
              press: () {
                Get.toNamed('/data-nelayan');
              },
            ),
            CardMenu(
              image: 'assets/images/illustration_konfirmasi_pesanan.svg',
              title: 'Konfirmasi Pesanan',
              color1: kColorLightkOrange,
              color2: kColorDarkOrange,
              press: () {
                Get.toNamed('/konfirmasi-pesanan-nelayan');
              },
            ),
          ],
        ),
        SizedBox(
          height: getPropertionateScreenHeight(20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardMenu(
              image: 'assets/images/illustration_data_hasil.svg',
              title: 'Data Hasil Tangkapan',
              color1: kColorLightkPurple,
              color2: kColorDarkPurple,
              press: () {
                Get.toNamed('/hasil-tangkapan-nelayan');
              },
            ),
            CardMenu(
              image: 'assets/images/illustration_laporan_harian.svg',
              title: 'Laporan Harian',
              color1: kColorLightkGreen,
              color2: kColorDarkGreen,
              press: () {
                Get.toNamed('/laporan-harian-nelayan');
              },
            ),
          ],
        ),
      ],
    );
  }
}
