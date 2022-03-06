part of 'components.dart';

class CardKurir extends StatelessWidget {
  const CardKurir({
    Key? key,
    required this.logo,
    required this.kurir,
    required this.harga,
    required this.berat,
  }) : super(key: key);

  final String logo, kurir, harga, berat;

  @override
  Widget build(BuildContext context) {
    return CollapseCard(
      content: [
        HeaderTextIcon(
          title: 'Kurir Pengantar',
          icon: Icons.car_repair,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: getPropertionateScreenHeight(50),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(logo),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kurir,
                    style: primaryTextStyle.copyWith(fontWeight: bold),
                  ),
                  Text(
                    "$berat Kg",
                    style: subtitleTextStyle.copyWith(fontWeight: light),
                  ),
                  Text(
                    "Rp$harga",
                    style: primaryLightTextStyle.copyWith(fontWeight: bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
