import 'package:flutter/material.dart';
import 'package:flutter_ruang_nelayan/config/config.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/login_screen/components/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: LoginBody(),
    );
  }
}
