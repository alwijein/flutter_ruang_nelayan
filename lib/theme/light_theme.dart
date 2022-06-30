part of 'theme.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kBackgroundColor1,
    appBarTheme: AppBarTheme(
      iconTheme: iconThemeData(),
      backgroundColor: kBackgroundColor1,
      titleTextStyle: primaryTextStyle.copyWith(
        fontSize: 18,
      ),
    ),
  );
}

IconThemeData iconThemeData() {
  return const IconThemeData(
    color: kPrimaryTextColor,
  );
}
