import 'package:flutter/material.dart';
import 'package:flutter_ruang_nelayan/config/config.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/register_screen/components/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: RegisterBody(),
    );
  }
}
