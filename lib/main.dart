import 'package:flutter/material.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/data_nelayan_screen/data_nelayan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/hasil_tangkapan_screen/tambah_ikan_screen/components/tambah_ikan_body.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/hasil_tangkapan_screen/tambah_ikan_screen/tambah_ikan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/home_screen/home_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/detail_laporan_harian_screen/detail_laporan_harian_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/laporan_harian_screen.dart';
import 'package:flutter_ruang_nelayan/screens/onboarding_screen/components/onboarding_body.dart';
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
      title: 'Ruang Nelayan',
      theme: theme(),
      home: const DetailLaporanHarianScreen(),
    );
  }
}
