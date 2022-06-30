import 'package:flutter_ruang_nelayan/boostrap.dart';

class AlamatPengantaran extends StatelessWidget {
  const AlamatPengantaran({
    Key? key,
    required this.alamat,
  }) : super(key: key);

  final String alamat;

  @override
  Widget build(BuildContext context) {
    return CollapseCard(
      content: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderTextIcon(
              icon: Icons.location_pin,
              title: 'Alamat Pengantaran',
            ),
            SizedBox(
              height: getPropertionateScreenHeight(10),
            ),
            Text(
              alamat,
              style: primaryLightTextStyle.copyWith(fontWeight: bold),
            ),
          ],
        ),
      ],
    );
  }
}
