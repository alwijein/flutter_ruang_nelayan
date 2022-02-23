import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/otp_screen/components/otp_form.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Kode OTP Berhasil Di Kirim',
                style: primaryTextStyle.copyWith(
                  fontSize: getPropertionateScreenWidht(18),
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: getPropertionateScreenHeight(24),
              ),
              SvgPicture.asset(
                'assets/images/Pict 3.svg',
                width: getPropertionateScreenWidht(300),
              ),
              Text(
                'Masukan kode verifikasi yang telah dikirimkan ke nomor anda',
                style: primaryTextStyle.copyWith(
                  fontSize: getPropertionateScreenWidht(16),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getPropertionateScreenHeight(24),
              ),
              const OtpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
