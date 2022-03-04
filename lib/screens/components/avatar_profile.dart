part of 'components.dart';

class AvatarProfile extends StatelessWidget {
  const AvatarProfile({
    Key? key,
    this.isEdit = false,
  }) : super(key: key);

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getPropertionateScreenHeight(24),
      ),
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/logo.png',
                ),
                radius: getPropertionateScreenWidht(30),
              ),
              isEdit
                  ? DefaultButtonGradient(
                      text: Text(
                        'Upload',
                        style: whiteTextStyle.copyWith(
                          fontWeight: bold,
                          fontSize: 11,
                        ),
                      ),
                      press: () {},
                      isInfinity: false,
                      color1: kColorLightkGreen,
                      color2: kColorDarkGreen,
                    )
                  : const SizedBox(),
            ],
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
