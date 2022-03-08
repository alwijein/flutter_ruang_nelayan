import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:get/get.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/register_screen/components/register_form.dart';

class HasilTangkapanBody extends StatelessWidget {
  const HasilTangkapanBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: getPropertionateScreenHeight(370),
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
              padding: EdgeInsets.all(getPropertionateScreenWidht(24)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Dapat Apa Saja Hari Ini?',
                      style: whiteTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: SvgPicture.asset(
                      'assets/images/illustration_fish.svg',
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: getPropertionateScreenHeight(165),
              left: getPropertionateScreenWidht(10),
              child: DefaultButtonGradient(
                text: Row(
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: kBackgroundColor1,
                      size: getPropertionateScreenWidht(18),
                    ),
                    SizedBox(
                      width: getPropertionateScreenWidht(4),
                    ),
                    Text(
                      'Hasil Tangkapan',
                      style: whiteTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
                press: () {
                  Get.toNamed("/hasil-tangkapan-nelayan/tambah-ikan");
                },
                isInfinity: false,
                color1: kColorLightkPurple,
                color2: kColorDarkPurple,
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
                  top: getPropertionateScreenHeight(24),
                  left: getPropertionateScreenHeight(24),
                  right: getPropertionateScreenHeight(24),
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Data Hasil Tangkapan',
                          style: primaryTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 16,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: getPropertionateScreenHeight(24),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: getPropertionateScreenHeight(10),
                              horizontal: getPropertionateScreenWidht(10)),
                          decoration: BoxDecoration(
                            color: kBackgroundColor1,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: getPropertionateScreenWidht(90),
                                    height: getPropertionateScreenHeight(110),
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          'assets/images/ikan_01.png',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: getPropertionateScreenWidht(7),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ikan Mujair',
                                        style: primaryTextStyle.copyWith(
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'hasil tangkapan: ',
                                          style: subtitleTextStyle.copyWith(
                                            fontSize: 11,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: '16',
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 11,
                                                ))
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Harga Per Kilo: ',
                                          style: subtitleTextStyle.copyWith(
                                            fontSize: 11,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: 'Rp31.000',
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 11,
                                                ))
                                          ],
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          text: 'Jasa Pengerjaan: ',
                                          style: subtitleTextStyle.copyWith(
                                            fontSize: 11,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: 'Fillet',
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontWeight: bold,
                                                  fontSize: 11,
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: getPropertionateScreenHeight(5),
                                      ),
                                      DefaultButtonOutlined(
                                          isInfinity: false,
                                          text: Text(
                                            'Edit',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              color: kPrimaryColor,
                                              fontWeight: medium,
                                            ),
                                          ),
                                          press: () {})
                                    ],
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: DefaultButtonGradient(
                                  text: Text(
                                    'Ikan Air Tawar',
                                    style: whiteTextStyle.copyWith(
                                      fontSize: 8,
                                    ),
                                  ),
                                  press: () {},
                                  isInfinity: false,
                                  color1: kColorLightkGreen,
                                  color2: kColorDarkGreen,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
