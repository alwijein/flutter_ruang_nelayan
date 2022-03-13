import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HeaderMenu extends StatelessWidget {
  HeaderMenu({
    Key? key,
  }) : super(key: key);

  final loginState = GetStorage();
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

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
                      text: " ${authProvider.user.name}",
                    ),
                  ),
                ),
              ],
            ),
            press: () {
              Get.toNamed('/data-nelayan');
            },
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
              GestureDetector(
                  onTap: () async {
                    if (await authProvider.logout()) {
                      loginState.write('status', false);
                      Get.offAllNamed('/onboarding');
                    } else {
                      Get.snackbar(
                        'Error',
                        'Gagal Logout',
                        colorText: kWhiteTextColor,
                        backgroundColor: Colors.red,
                      );
                    }
                  },
                  child: SvgPicture.asset('assets/icons/logout.svg')),
            ],
          ),
        ),
      ],
    );
  }
}
