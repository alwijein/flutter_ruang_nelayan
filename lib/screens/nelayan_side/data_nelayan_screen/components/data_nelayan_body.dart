import 'package:flutter_ruang_nelayan/boostrap.dart';

class DataNelayanBody extends StatelessWidget {
  const DataNelayanBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Data Nelayan',
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
                              Text(
                                'Edit Profile',
                                style: whiteTextStyle.copyWith(
                                  fontWeight: bold,
                                  fontSize: 12,
                                ),
                              )
                            ],
                          ),
                          color1: kColorLightkOrange,
                          color2: kColorDarkOrange,
                          press: () {},
                        ),
                      ],
                    ),
                    AvatarProfile(),
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

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getPropertionateScreenHeight(24),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/logo.png',
            ),
            radius: getPropertionateScreenWidht(30),
          ),
          SizedBox(
            width: getPropertionateScreenWidht(20),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/icons/face_icon.svg'),
                  SizedBox(
                    width: getPropertionateScreenWidht(14),
                  ),
                  Text(
                    'Dg. Tompo',
                    style: subtitleTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/phone_icon.svg',
                  ),
                  SizedBox(
                    width: getPropertionateScreenWidht(14),
                  ),
                  Text(
                    '089xxxx',
                    style: subtitleTextStyle,
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/location_icon.svg',
                  ),
                  SizedBox(
                    width: getPropertionateScreenWidht(22),
                  ),
                  Text(
                    'Jl. Gunung Latimojong',
                    style: subtitleTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
