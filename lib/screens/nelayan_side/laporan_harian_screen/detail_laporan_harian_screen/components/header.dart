import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/components/profile_image.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultButton(
          isInfinity: false,
          text: Text(
            '11 Februari 2022, 14:30',
            style: whiteTextStyle.copyWith(
              fontWeight: bold,
            ),
          ),
          press: () {},
          color: kColorDarkGreen,
        ),
        SizedBox(
          height: getPropertionateScreenHeight(16),
        ),
        ProfileImage(
          img: 'assets/images/ikan_01.png',
          name: 'Dg. Tompo',
        ),
        SizedBox(
          height: getPropertionateScreenHeight(10),
        ),
      ],
    );
  }
}
