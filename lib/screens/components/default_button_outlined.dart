part of 'components.dart';

class DefaultButtonOutlined extends StatelessWidget {
  const DefaultButtonOutlined({
    Key? key,
    required this.text,
    required this.press,
    this.isInfinity = true,
    this.width = 56,
  }) : super(key: key);

  final Widget text;
  final Function() press;
  final bool isInfinity;
  final double width;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flabuttonStyle = TextButton.styleFrom(
      padding: EdgeInsets.symmetric(
        horizontal: getPropertionateScreenWidht(24),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      side: const BorderSide(width: 2, color: kPrimaryColor),
    );
    return SizedBox(
        width: isInfinity ? double.infinity : null,
        height: getPropertionateScreenHeight(width),
        child: OutlinedButton(
          style: flabuttonStyle,
          onPressed: press,
          child: text,
        ));
  }
}
