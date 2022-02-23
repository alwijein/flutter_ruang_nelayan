import 'package:flutter/material.dart';
import 'package:flutter_ruang_nelayan/constants/constants.dart';

class AskUserStatus extends StatelessWidget {
  const AskUserStatus({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.press,
  }) : super(key: key);

  final String title, subTitle;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: subtitleTextStyle,
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            subTitle,
            style: purpleTextStyle.copyWith(
              fontWeight: medium,
            ),
          ),
        ),
      ],
    );
  }
}
