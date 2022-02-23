import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/login_screen/components/header.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/login_screen/components/login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
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
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
