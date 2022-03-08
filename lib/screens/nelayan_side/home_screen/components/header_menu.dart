import 'package:flutter_ruang_nelayan/boostrap.dart';

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 7,
          child: DefaultButtonOutlined(
            isInfinity: false,
            text: Row(
              children: [
                SvgPicture.asset('assets/icons/person_icon.svg'),
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    text: TextSpan(
                      style: primaryLightTextStyle,
                      text: 'Pak Sutyo Mulyo',
                    ),
                  ),
                ),
              ],
            ),
            press: () {},
          ),
        ),
        Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/icons/alarm.svg'),
              SvgPicture.asset('assets/icons/chat.svg'),
              SvgPicture.asset('assets/icons/info.svg'),
              SvgPicture.asset('assets/icons/logout.svg'),
            ],
          ),
        ),
      ],
    );
  }
}
