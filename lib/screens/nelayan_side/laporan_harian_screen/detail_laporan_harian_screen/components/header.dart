import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/user_model.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/components/profile_image.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel userModel = authProvider.user;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultButton(
          isInfinity: false,
          text: Text(
            // '11 Februari 2022, 14:30',
            date,
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
          img: userModel.avatar ?? 'assets/images/default_person.png',
          name: userModel.name ?? 'User',
        ),
        SizedBox(
          height: getPropertionateScreenHeight(10),
        ),
      ],
    );
  }
}
