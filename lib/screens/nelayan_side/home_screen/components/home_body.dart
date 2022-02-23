import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/home_screen/components/card_menu.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: getPropertionateScreenHeight(305),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/illustration_home.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: getPropertionateScreenHeight(505),
                decoration: const BoxDecoration(
                  color: kBackgroundColor1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.only(
                  top: getPropertionateScreenWidht(15),
                  left: getPropertionateScreenWidht(15),
                  right: getPropertionateScreenWidht(15),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 7,
                          child: DefaultButtonOutlined(
                            isInfinity: false,
                            text: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/person_icon.svg'),
                                Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    text: TextSpan(
                                        style: primaryLightTextStyle,
                                        text: 'Pak Sutyo Mulyo'),
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
                    ),
                    SizedBox(
                      height: getPropertionateScreenHeight(20),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardMenu(
                              image:
                                  'assets/images/illustration_data_nelayan.svg',
                              title: 'Data Nelayan',
                              color1: kBackgroundColor3,
                              color2: kBackgroundColor4,
                            ),
                            CardMenu(
                              image:
                                  'assets/images/illustration_konfirmasi_pesanan.svg',
                              title: 'Konfirmasi Pesanan',
                              color1: kBackgroundColor3,
                              color2: kBackgroundColor4,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: getPropertionateScreenHeight(20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CardMenu(
                              image:
                                  'assets/images/illustration_data_hasil.svg',
                              title: 'Data Hasil Tangkapan',
                              color1: kBackgroundColor3,
                              color2: kBackgroundColor4,
                            ),
                            CardMenu(
                              image:
                                  'assets/images/illustration_laporan_harian.svg',
                              title: 'Laporan Harian',
                              color1: kBackgroundColor3,
                              color2: kBackgroundColor4,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
