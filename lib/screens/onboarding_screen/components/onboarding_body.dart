import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage role = GetStorage();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(getPropertionateScreenWidht(24)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: getPropertionateScreenWidht(250),
          ),
          SizedBox(
            height: getPropertionateScreenHeight(24),
          ),
          DefaultButton(
            text: Text(
              'Beli Ikan',
              style: whiteTextStyle.copyWith(
                fontWeight: medium,
              ),
            ),
            press: () {
              role.write('role', 'costumer');
              Get.toNamed('/login');
            },
          ),
          SizedBox(
            height: getPropertionateScreenHeight(18),
          ),
          DefaultButtonOutlined(
            text: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('assets/icons/fishing.svg'),
                Text(
                  'Masuk Sebagai Nelayan',
                  style: primaryTextStyle.copyWith(
                    color: kPrimaryColor,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
            press: () {
              role.write('role', 'nelayan');

              Get.toNamed('/login');
            },
          )
        ],
      ),
    );
  }
}
