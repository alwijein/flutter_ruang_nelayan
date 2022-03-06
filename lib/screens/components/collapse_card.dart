part of 'components.dart';

class CollapseCard extends StatelessWidget {
  const CollapseCard({
    Key? key,
    required this.content,
  }) : super(key: key);

  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: getPropertionateScreenHeight(18),
      ),
      padding: EdgeInsets.symmetric(
        vertical: getPropertionateScreenHeight(10),
        horizontal: getPropertionateScreenWidht(20),
      ),
      decoration: BoxDecoration(
        color: kBackgroundColor1,
        borderRadius: BorderRadius.circular(20),
        boxShadow: softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content,
      ),
    );
  }
}
