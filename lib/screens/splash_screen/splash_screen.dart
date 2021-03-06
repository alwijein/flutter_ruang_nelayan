import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:flutter_ruang_nelayan/providers/hasil_tangkapan_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

final loginState = GetStorage();

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<AuthProvider>(context, listen: false).getUser();

    print("xsdsds " + loginState.read('status').toString());
    if (loginState.read('status')) {
      if (loginState.read('role').toString() != 'costumer') {
        Get.offNamed('/home-nelayan');
      } else if (loginState.read('role').toString() != 'nelayan') {
        await Provider.of<HasilTangkapanProvider>(context, listen: false)
            .getAllHasilTangkapan();
        Get.offNamed('/home-costumer');
      }
    } else {
      Get.offNamed('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor1,
      body: Container(
        padding: EdgeInsets.all(getPropertionateScreenWidht(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 40,
                  ),
                  const CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(kPrimaryLightColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
