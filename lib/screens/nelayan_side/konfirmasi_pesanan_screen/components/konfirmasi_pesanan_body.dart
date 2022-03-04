import 'package:flutter_ruang_nelayan/boostrap.dart';

class KonfirmasiPesananBody extends StatelessWidget {
  const KonfirmasiPesananBody({Key? key}) : super(key: key);

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
            Text(
              'Apakah anda telah mengemas pesanan costumer?',
              style: primaryTextStyle,
            ),
            SvgPicture.asset(
              'assets/images/illustration_verifikasi.svg',
            ),
            Text(
              'Jika sudah, klik lanjutkan untuk memasukkan nomor resi pengiriman',
              style: primaryTextStyle,
            ),
            DefaultButton(
              text: Text(
                'Lanjutkan',
                style: whiteTextStyle,
              ),
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
