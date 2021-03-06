import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/register_screen/components/register_form.dart';
import 'package:get_storage/get_storage.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetStorage role = GetStorage();
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: getPropertionateScreenHeight(300),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    kColorDarkBlue,
                    kColorLightkBlue,
                  ],
                ),
              ),
              padding: EdgeInsets.all(defaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      role.read('role').toString() == 'nelayan'
                          ? 'Mulai Sebagai Nelayan Sukses Sekarang'
                          : 'Ayo Langganan Sekarang',
                      style: whiteTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SvgPicture.asset('assets/images/Pict 1.svg'),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: getPropertionateScreenHeight(550),
                decoration: const BoxDecoration(
                  color: kBackgroundColor1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.only(
                  top: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                child: const SingleChildScrollView(
                  child: RegisterForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
