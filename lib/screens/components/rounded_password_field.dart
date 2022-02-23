part of 'components.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({Key? key, required this.onChanged})
      : super(key: key);

  final Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      isWrapSize: false,
      child: TextField(
        onChanged: onChanged(),
        obscureText: true,
        style: primaryTextStyle,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.lock,
            color: kPrimaryLightColor,
          ),
          suffix: const Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          hintText: "Password",
          hintStyle: subtitleTextStyle,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
