import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/data_nelayan_screen/data_nelayan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/hasil_tangkapan_screen/hasil_tangkapan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/hasil_tangkapan_screen/tambah_ikan_screen/tambah_ikan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/home_screen/home_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/konfirmasi_pesanan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/laporan_harian_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/login_screen/login_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/otp_screen/otp_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/register_screen/register_screen.dart';
import 'package:flutter_ruang_nelayan/screens/onboarding_screen/onboarding_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ruang Nelayan',
        theme: theme(),
        initialRoute: '/onboarding',
        getPages: [
          // Nelayan Side

          GetPage(name: '/onboarding', page: () => const OnboardingScreen()),
          GetPage(name: '/login-nelayan', page: () => const LoginScreen()),
          GetPage(
              name: '/register-nelayan', page: () => const RegisterScreen()),
          GetPage(name: '/otp-nelayan', page: () => const OtpScreen()),
          GetPage(name: '/home-nelayan', page: () => const HomeScreen()),
          GetPage(name: '/data-nelayan', page: () => const DataNelayanScreen()),

          GetPage(
              name: '/hasil-tangkapan-nelayan',
              page: () => const HasilTangkapanScreen()),
          // Hasil Tnagkapan SubRoute
          GetPage(
              name: '/hasil-tangkapan-nelayan/tambah-ikan',
              page: () => const TambahIkanScreen()),

          GetPage(
              name: '/laporan-harian-nelayan',
              page: () => const LaporanHarianScreen()),
          GetPage(
              name: '/konfirmasi-pesanan-nelayan',
              page: () => const KonfirmasiPesananScreen()),
        ],
      ),
    );
  }
}
