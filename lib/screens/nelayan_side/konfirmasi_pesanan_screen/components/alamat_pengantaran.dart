import 'package:flutter_ruang_nelayan/boostrap.dart';

class AlamatPengantaran extends StatelessWidget {
  const AlamatPengantaran({
    Key? key,
    required this.alamat,
    required this.jalan,
    required this.kota,
    required this.kabupaten,
  }) : super(key: key);

  final String alamat, jalan, kota, kabupaten;

  @override
  Widget build(BuildContext context) {
    return CollapseCard(
      content: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderTextIcon(
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
            Text(
              jalan,
              style: primaryTextStyle,
            ),
            Text(
              kota,
              style: primaryTextStyle,
            ),
            Text(
              kabupaten,
              style: primaryTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
