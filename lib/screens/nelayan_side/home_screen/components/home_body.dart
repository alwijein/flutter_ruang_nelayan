import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/home_screen/components/body_menu.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/home_screen/components/card_menu.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/home_screen/components/header_menu.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: getPropertionateScreenHeight(305),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/illustration_home.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: getPropertionateScreenHeight(505),
                decoration: const BoxDecoration(
                  color: kBackgroundColor1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.only(
                  top: getPropertionateScreenWidht(15),
                  left: getPropertionateScreenWidht(15),
                  right: getPropertionateScreenWidht(15),
                ),
                child: Column(
                  children: [
                    HeaderMenu(),
                    SizedBox(
                      height: getPropertionateScreenHeight(24),
                    ),
                    BodyMenu(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
