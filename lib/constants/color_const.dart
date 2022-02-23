part of 'constants.dart';

// constant color for app
const Color kPrimaryColor = Color(0xff0D93FC);
const Color kPrimaryLightColor = Color.fromARGB(255, 83, 160, 219);
const Color kSecondaryColor = Color(0xff38ABBE);
const Color kAlertColor = Color(0xffED6363);
const Color kPriceColor = Color(0xff2C96F1);
const Color kcardColor = Color(0xffECEDEF);
const Color kGreenColor = Color(0xFF51C17E);

// constant color for background app
const Color kBackgroundColor1 = Color.fromARGB(255, 255, 255, 255);
const Color kBackgroundColor2 = Color(0xffE7F3FE);
const Color kBackgroundColor3 = Color(0xff1F86FD);
const Color kBackgroundColor4 = Color(0xff1FC4F6);
const Color kBackgroundColor5 = Color(0xff2B2844);

// constant color for text style
const Color kPrimaryTextColor = Color(0xff2E2E2E);
const Color kPrimaryLightTextColor = Color(0xff2E2E2E);
const Color kSecondaryTextColor = Color(0xff999999);
const Color kSubtitleTextColor = Color(0xff504F5E);
const Color kWhiteTextColor = Color.fromARGB(255, 255, 255, 255);

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: getPropertionateScreenWidht(15),
  ),
  focusColor: kPrimaryColor,
  border: InputBorder.none,
);
