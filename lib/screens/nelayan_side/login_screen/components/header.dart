import 'package:flutter/material.dart';
import 'package:flutter_ruang_nelayan/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            'Sudah Punya Akun?,Masuk Disini',
            style: primaryTextStyle.copyWith(
              fontWeight: bold,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SvgPicture.asset('assets/images/Pict.svg'),
        ),
      ],
    );
  }
}
