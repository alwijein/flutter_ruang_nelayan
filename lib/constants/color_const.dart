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

const Color kColorDarkBlue = Color(0xff1F86FD);
const Color kColorLightkBlue = Color(0xff1FC4F6);

const Color kColorLightkOrange = Color(0xffFDFD00);
const Color kColorDarkOrange = Color(0xffFF6F00);

const Color kColorLightkPurple = Color(0xffFF429A);
const Color kColorDarkPurple = Color(0xffA11AAA);

const Color kColorDarkGreen = Color(0xff32B40C);
const Color kColorLightkGreen = Color(0xff8BEC0C);

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

List<BoxShadow> softShadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 3,
    blurRadius: 4,
    offset: Offset(0, 3), // changes position of shadow
  )
];
