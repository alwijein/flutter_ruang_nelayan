import 'package:flutter/material.dart';
import 'package:flutter_ruang_nelayan/config/config.dart';
import 'package:flutter_ruang_nelayan/constants/constants.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key? key,
    required this.child,
    this.sizeWidht = 0.0,
    required this.isWrapSize,
  }) : super(key: key);

  final Widget child;
  final double? sizeWidht;
  final bool isWrapSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: getPropertionateScreenWidht(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getPropertionateScreenHeight(20),
        vertical: getPropertionateScreenWidht(0),
      ),
      width: isWrapSize ? sizeWidht : SizeConfig.screenWidth,
      decoration: BoxDecoration(
        color: kBackgroundColor2,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
