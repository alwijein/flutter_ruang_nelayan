import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/login_screen/components/header.dart';
import 'package:flutter_ruang_nelayan/screens/login_screen/components/login_form.dart';
import 'package:get/get.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Spacer(),
            const Header(),
            SizedBox(
              height: getPropertionateScreenHeight(50),
            ),
            const LoginForm(),
            const Spacer(),
            AskUserStatus(
              title: 'Belum punya akun? ',
              subTitle: 'Daftar',
              press: () {
                Get.toNamed('register');
              },
            ),
          ],
        ),
      ),
    );
  }
}
