part of 'components.dart';

class HeaderTextIcon extends StatelessWidget {
  const HeaderTextIcon({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: kPrimaryColor,
        ),
        SizedBox(
          width: getPropertionateScreenWidht(10),
        ),
        Text(
          title,
          style: primaryTextStyle,
        ),
      ],
    );
  }
}
