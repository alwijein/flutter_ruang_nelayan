
import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/controllers/state_controller.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/data_nelayan_screen/components/avatar_profile.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataNelayanBody extends StatelessWidget {
  const DataNelayanBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    StateController stateController = Get.put(StateController());
    GetStorage role = GetStorage();
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: getPropertionateScreenWidht(315),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/illustration_akun_nelayan.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: getPropertionateScreenHeight(550),
                decoration: const BoxDecoration(
                  color: kBackgroundColor1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.only(
                  top: getPropertionateScreenWidht(24),
                  left: getPropertionateScreenWidht(24),
                  right: getPropertionateScreenWidht(24),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            role.read('role').toString() == 'nelayan'
                                ? 'Data Nelayan'
                                : 'Data Costumer',
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: getPropertionateScreenWidht(10),
                          ),
                          DefaultButtonGradient(
                            isInfinity: false,
                            text: Row(
                              children: [
                                const Icon(
                                  Icons.verified_user_outlined,
                                  color: kWhiteTextColor,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: getPropertionateScreenWidht(5),
                                ),
                                Obx(() => Text(
                                      stateController.titleEditProfile.value,
                                      style: whiteTextStyle.copyWith(
                                        fontWeight: bold,
                                        fontSize: 12,
                                      ),
                                    ))
                              ],
                            ),
                            color1: kColorLightkOrange,
                            color2: kColorDarkOrange,
                            press: () {
                              stateController.editProfile();
                            },
                          ),
                        ],
                      ),
                      Obx(() => AvatarProfile(
                            isEdit: stateController.isEditProfile.value,
                            name: authProvider.user.name ?? '',
                            noTelp: authProvider.user.noTelp ?? '',
                            alamat: authProvider.user.alamat ?? '',
                            avatar: authProvider.user.avatar,
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
