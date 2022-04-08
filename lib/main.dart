import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:flutter_ruang_nelayan/providers/cart_provider.dart';
import 'package:flutter_ruang_nelayan/providers/hasil_tangkapan_provider.dart';
import 'package:flutter_ruang_nelayan/providers/ikan_air_tawar_provider.dart';
import 'package:flutter_ruang_nelayan/providers/jasa_pengantaran_provider.dart';
import 'package:flutter_ruang_nelayan/providers/jenis_ikan_provider.dart';
import 'package:flutter_ruang_nelayan/providers/jenis_pengerjaan_ikan.dart';
import 'package:flutter_ruang_nelayan/providers/laporan_harian_provider.dart';
import 'package:flutter_ruang_nelayan/providers/transaction_provider.dart';
import 'package:flutter_ruang_nelayan/screens/chat_screen/chat_screen.dart';
import 'package:flutter_ruang_nelayan/screens/chat_screen/detail_chat_screen/detail_chat_screen.dart';
import 'package:flutter_ruang_nelayan/screens/costumer_side/cart_screen/cart_screen.dart';
import 'package:flutter_ruang_nelayan/screens/costumer_side/checkout_screen/checkout_screen.dart';
import 'package:flutter_ruang_nelayan/screens/costumer_side/detail_ikan_screen/detail_ikan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/costumer_side/home_screen_costumer/home_screen_costumer.dart';
import 'package:flutter_ruang_nelayan/screens/costumer_side/ikan_air_tawar_screen/ikan_air_tawar_screen.dart';
import 'package:flutter_ruang_nelayan/screens/costumer_side/notifikasi_screen/notifikasi_screen.dart';
import 'package:flutter_ruang_nelayan/screens/costumer_side/snap_screen/snap_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/data_nelayan_screen/data_nelayan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/hasil_tangkapan_screen/hasil_tangkapan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/hasil_tangkapan_screen/tambah_ikan_screen/tambah_ikan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/home_screen/home_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/detail_konfirmasi_pesanan_screen/detail_konfirmasi_pesanan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/konfirmasi_pesanan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/proses_pemesanan_screen/proses_pemesanan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/data_penjualan_screen/data_penjualan_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/detail_laporan_harian_screen/detail_laporan_harian_screen.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/laporan_harian_screen.dart';
import 'package:flutter_ruang_nelayan/screens/login_screen/login_screen.dart';
import 'package:flutter_ruang_nelayan/screens/otp_screen/otp_screen.dart';
import 'package:flutter_ruang_nelayan/screens/register_screen/register_screen.dart';
import 'package:flutter_ruang_nelayan/screens/onboarding_screen/onboarding_screen.dart';
import 'package:flutter_ruang_nelayan/screens/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final loginState = GetStorage();

  @override
  Widget build(BuildContext context) {
    loginState.writeIfNull('lastVisit', 'init');
    loginState.writeIfNull('status', false);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HasilTangkapanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JenisIkanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JenisPengerjaanIkanProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => IkanAirTawarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JasaPengantaranProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LaporanHarianProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ruang Nelayan',
        theme: theme(),
        initialRoute: '/splash-screen',
        getPages: [
          GetPage(name: '/splash-screen', page: () => const SplashScreen()),
          GetPage(name: '/onboarding', page: () => const OnboardingScreen()),
          GetPage(name: '/login', page: () => const LoginScreen()),
          GetPage(name: '/register', page: () => const RegisterScreen()),
          GetPage(name: '/otp', page: () => const OtpScreen()),
          GetPage(name: '/chat', page: () => ChatScreen()),
          GetPage(name: '/chat/detail', page: () => DetailChatScreen()),

          // Nelayan Side
          GetPage(name: '/home-nelayan', page: () => const HomeScreen()),
          GetPage(name: '/data-nelayan', page: () => const DataNelayanScreen()),

          // Route for hasil tangkapan
          GetPage(
            name: '/hasil-tangkapan-nelayan',
            page: () => const HasilTangkapanScreen(),
          ),
          GetPage(
            name: '/hasil-tangkapan-nelayan/tambah-ikan',
            page: () => const TambahIkanScreen(),
          ),
          // Route for laporan harian nelayan
          GetPage(
            name: '/laporan-harian-nelayan',
            page: () => const LaporanHarianScreen(),
          ),
          GetPage(
            name: '/laporan-harian-nelayan/detail',
            page: () => const DetailLaporanHarianScreen(),
          ),
          GetPage(
            name: '/laporan-harian-nelayan/detail/data-penjualan',
            page: () => const DataPenjualanScreen(),
          ),

          GetPage(
              name: '/konfirmasi-pesanan-nelayan',
              page: () => const KonfirmasiPesananScreen()),
          GetPage(
              name: '/konfirmasi-pesanan-nelayan/detail',
              page: () => const DetailKonfirmasiPesananScreen()),
          GetPage(
              name: '/proses-pemesanan-nelayan',
              page: () => const ProsesPemesananScreen()),

          // Costumer Side
          GetPage(
              name: '/home-costumer', page: () => const HomeScreenCostumer()),
          GetPage(
              name: '/ikan-air-tawar-costumer',
              page: () => const IkanAirTawarScreen()),
          GetPage(name: '/detail-ikan', page: () => const DetailIkanScreen()),
          GetPage(name: '/cart', page: () => CartScreen()),
          GetPage(name: '/checkout', page: () => CheckoutScreen()),
          GetPage(name: '/snap', page: () => SnapScreen()),

          GetPage(name: '/notifikasi', page: () => NotifikasiScreen()),
        ],
      ),
    );
  }
}
