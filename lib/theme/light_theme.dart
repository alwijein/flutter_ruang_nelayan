part of 'theme.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kBackgroundColor1,
    appBarTheme: AppBarTheme(
      backgroundColor: kBackgroundColor1,
      titleTextStyle: primaryTextStyle.copyWith(
        fontSize: 18,
      ),
    ),
  );
}
