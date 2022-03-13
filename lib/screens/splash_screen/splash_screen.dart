import 'dart:async';

import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/user_model.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() async {
  //   super.initState();
  //   bool isComplete =
  //       await Provider.of<AuthProvider>(context, listen: false).getUser();
  //   if (isComplete) {
  //     Timer(Duration(seconds: 3), () {});
  //   }
  //   SizedBox();
  // }

  @override
  Widget build(BuildContext context) {
    final loginState = GetStorage();

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor1,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(getPropertionateScreenWidht(24)),
          child: FutureBuilder<bool>(
              future: authProvider.getUser(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Timer(Duration(seconds: 1), () {
                    loginState.read('status')
                        ? Get.offNamed('/home-nelayan')
                        : Get.offNamed('/onboarding');
                  });
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/logo.png'),
                            SizedBox(
                              height: 40,
                            ),
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  kPrimaryLightColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return SizedBox();
              }),
        ),
      ),
    );
  }
}
