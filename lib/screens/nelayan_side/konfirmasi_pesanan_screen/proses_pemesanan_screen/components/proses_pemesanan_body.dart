import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/providers/laporan_harian_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProsesPemesananBody extends StatelessWidget {
  ProsesPemesananBody({Key? key}) : super(key: key);

  final GetStorage loginState = GetStorage();

  @override
  Widget build(BuildContext context) {
    String toDayDate = FormatDate.formatDate(DateTime.now()).toString();
    LaporanHarianProvider laporanHarianProvider =
        Provider.of<LaporanHarianProvider>(context);
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(
          getPropertionateScreenWidht(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Pesanan berhasil diproses',
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: getPropertionateScreenHeight(24),
            ),
            SvgPicture.asset(
              'assets/images/illustration_proses.svg',
            ),
            SizedBox(
              height: getPropertionateScreenHeight(24),
            ),
            DefaultButton(
              text: Text(
                'OK',
                style: whiteTextStyle,
              ),
              press: () async {
                if (toDayDate != loginState.read('lastVisit')) {
                  await laporanHarianProvider.inputLaporan();
                  loginState.write('lastVisit', toDayDate);
                }
                Get.offAllNamed('/home-nelayan');
              },
            ),
          ],
        ),
      ),
    );
  }
}
