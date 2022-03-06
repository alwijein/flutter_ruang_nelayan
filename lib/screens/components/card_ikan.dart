part of 'components.dart';

class CardIkan extends StatelessWidget {
  const CardIkan({
    Key? key,
    required this.qty,
    required this.harga,
    required this.jasa,
    required this.hargaPengerjaan,
    required this.total,
  }) : super(key: key);

  final String qty, harga, jasa, hargaPengerjaan, total;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: getPropertionateScreenHeight(14)),
      height: getPropertionateScreenHeight(195),
      padding: EdgeInsets.symmetric(
        vertical: getPropertionateScreenHeight(10),
        horizontal: getPropertionateScreenWidht(10),
      ),
      decoration: BoxDecoration(
        color: kBackgroundColor1,
        borderRadius: BorderRadius.circular(20),
        boxShadow: softShadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              // width: getPropertionateScreenWidht(90),
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/ikan_01.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            width: getPropertionateScreenWidht(7),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Ikan Tuna',
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(width: getPropertionateScreenWidht(8)),
                    DefaultButtonGradient(
                      text: Text(
                        'Ikan Air Laut',
                        style: whiteTextStyle.copyWith(
                          fontSize: 8,
                        ),
                      ),
                      press: () {},
                      isInfinity: false,
                      color1: kColorLightkBlue,
                      color2: kColorDarkBlue,
                    ),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: 'Qty: ',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 11,
                    ),
                    children: [
                      TextSpan(
                          text: "$qty Kg",
                          style: primaryTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 11,
                          ))
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Harga Per Kilo: ',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 11,
                    ),
                    children: [
                      TextSpan(
                          text: "Rp$harga",
                          style: primaryTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 11,
                          ))
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Jasa Pengerjaan: ',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 11,
                    ),
                    children: [
                      TextSpan(
                          text: jasa,
                          style: primaryTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 11,
                          ))
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Harga Pengerjaan: ',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 11,
                    ),
                    children: [
                      TextSpan(
                          text: "$hargaPengerjaan / kg",
                          style: primaryTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 11,
                          ))
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'Total: ',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 11,
                    ),
                    children: [
                      TextSpan(
                          text: 'Rp300.000',
                          style: primaryLightTextStyle.copyWith(
                            fontWeight: bold,
                            fontSize: 11,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: getPropertionateScreenHeight(5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
