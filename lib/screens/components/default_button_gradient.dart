part of 'components.dart';

class DefaultButtonGradient extends StatelessWidget {
  const DefaultButtonGradient({
    Key? key,
    required this.text,
    required this.press,
    required this.isInfinity,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  final Widget text;
  final Function() press;
  final bool isInfinity;
  final Color color1, color2;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flabuttonStyle = TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
    return SizedBox(
        width: isInfinity ? double.infinity : null,
        child: TextButton(
          style: flabuttonStyle,
          onPressed: press,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: getPropertionateScreenWidht(5),
              horizontal: getPropertionateScreenWidht(8),
            ),
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
            child: text,
          ),
        ));
  }
}
