import 'package:flutter/material.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/login_screen/login_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/register_screen/register_screen.dart';
import 'package:flutter_ruang_nelayan/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter_ruang_nelayan/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: RegisterScreen(),
    );
  }
}
