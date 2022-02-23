import 'package:flutter/material.dart';
import 'package:flutter_ruang_nelayan/config/config.dart';
import 'package:flutter_ruang_nelayan/constants/constants.dart';
import 'package:flutter_ruang_nelayan/screens/components/ask_user_status.dart';
import 'package:flutter_ruang_nelayan/screens/components/default_button.dart';
import 'package:flutter_ruang_nelayan/screens/components/rounded_input_field.dart';
import 'package:flutter_ruang_nelayan/screens/components/rounded_password_field.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/login_screen/components/header.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            Spacer(),
            Header(),
            SizedBox(
              height: getPropertionateScreenHeight(50),
            ),
            RoundedInputField(
              hintText: 'Nomor Handphone',
              press: () {},
              iconData: Icons.call,
            ),
            RoundedPasswordField(onChanged: () {}),
            SizedBox(
              height: getPropertionateScreenHeight(18),
            ),
            DefaultButton(
              text: Text(
                'Masuk',
                style: whiteTextStyle.copyWith(fontWeight: medium),
              ),
              press: () {},
            ),
            Spacer(),
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
