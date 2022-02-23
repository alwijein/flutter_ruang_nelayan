import 'package:flutter/material.dart';
import 'package:flutter_ruang_nelayan/config/config.dart';
import 'package:flutter_ruang_nelayan/constants/constants.dart';

class DefaultButtonOutlined extends StatelessWidget {
  const DefaultButtonOutlined({
    Key? key,
    required this.text,
    required this.press,
    this.isInfinity = true,
  }) : super(key: key);

  final Widget text;
  final Function() press;
  final bool isInfinity;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flabuttonStyle = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: getPropertionateScreenWidht(8),
        horizontal: getPropertionateScreenWidht(24),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      side: const BorderSide(width: 2, color: kPrimaryColor),
    );
    return SizedBox(
        width: isInfinity ? double.infinity : 43.0,
        height: getPropertionateScreenHeight(56),
        child: OutlinedButton(
          style: flabuttonStyle,
          onPressed: press,
          child: text,
        ));
  }
}
