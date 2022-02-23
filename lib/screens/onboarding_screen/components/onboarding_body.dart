import 'package:flutter/material.dart';
import 'package:flutter_ruang_nelayan/config/config.dart';
import 'package:flutter_ruang_nelayan/constants/constants.dart';
import 'package:flutter_ruang_nelayan/screens/components/default_button.dart';
import 'package:flutter_ruang_nelayan/screens/components/default_button_outlined.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(defaultPadding),
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
            press: () {},
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
            press: () {},
          )
        ],
      ),
    );
  }
}
