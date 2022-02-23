part of 'components.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.press,
    required this.iconData,
    this.isWrap = false,
    this.sizeWidth,
  }) : super(key: key);

  final String hintText;
  final Function() press;
  final bool isWrap;
  final double? sizeWidth;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      isWrapSize: isWrap,
      sizeWidht: sizeWidth,
      child: TextField(
        style: primaryTextStyle,
        onChanged: press(),
        decoration: InputDecoration(
          icon: Icon(
            iconData,
            color: kPrimaryLightColor,
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: subtitleTextStyle,
        ),
      ),
    );
  }
}
