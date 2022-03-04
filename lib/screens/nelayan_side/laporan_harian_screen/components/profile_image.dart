import 'package:flutter_ruang_nelayan/boostrap.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key? key,
    required this.img,
    required this.name,
  }) : super(key: key);

  final String img, name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(img),
        ),
        SizedBox(
          width: getPropertionateScreenWidht(10),
        ),
        Text(
          name,
          style: primaryLightTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
