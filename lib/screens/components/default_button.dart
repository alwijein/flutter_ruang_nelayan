part of 'components.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
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
      backgroundColor: kPrimaryColor,
      padding: EdgeInsets.symmetric(
        horizontal: getPropertionateScreenWidht(24),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
    return SizedBox(
        width: isInfinity ? double.infinity : null,
        height: getPropertionateScreenHeight(width),
        child: TextButton(
          style: flabuttonStyle,
          onPressed: press,
          child: text,
        ));
  }
}
