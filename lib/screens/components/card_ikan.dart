part of 'components.dart';

class CardIkan extends StatelessWidget {
  const CardIkan({
    required this.cartModel,
    Key? key,
  }) : super(key: key);

  final CartModel cartModel;

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
                      cartModel.hasilTangkapanModel!.namaIkan.toString(),
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(width: getPropertionateScreenWidht(8)),
                    DefaultButtonGradient(
                      text: Text(
                        cartModel.hasilTangkapanModel!.jenisIkan.toString(),
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
                          text: "${cartModel.hasilTangkapanModel!.jumlah} Kg",
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
                          text: formatCurrency
                              .format(cartModel.hasilTangkapanModel!.harga)
                              .toString()
                              .replaceAll(regex, ''),
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
                          text: 's',
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
                          text: " / kg",
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
