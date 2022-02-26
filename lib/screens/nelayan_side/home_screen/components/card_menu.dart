import 'package:flutter_ruang_nelayan/boostrap.dart';

class CardMenu extends StatelessWidget {
  const CardMenu({
    Key? key,
    required this.image,
    required this.title,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  final String image, title;
  final Color color1, color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getPropertionateScreenHeight(130),
      width: getPropertionateScreenWidht(165),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1,
            color2,
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              image,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: whiteTextStyle.copyWith(
              fontSize: 13,
                fontWeight: bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
