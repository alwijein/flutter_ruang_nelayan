import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/otp_screen/components/otp_body.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/otp_screen/components/otp_testing.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: OtpBody(),
    );
  }
}
