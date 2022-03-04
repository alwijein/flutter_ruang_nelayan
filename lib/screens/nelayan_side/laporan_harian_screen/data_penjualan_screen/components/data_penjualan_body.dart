import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/components/profile_image.dart';

class DataPenjualanBody extends StatelessWidget {
  const DataPenjualanBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            getPropertionateScreenWidht(24),
          ),
          child: Column(
            children: [
              ProfileImage(
                img: 'assets/images/ikan_01.png',
                name: 'Sutono',
              ),
              SizedBox(
                height: getPropertionateScreenHeight(10),
              ),
              Divider(
                thickness: 2.0,
              ),
              CollapseCard(
                content: [
                  HeaderText(
                    title: 'Ikan yang dibeli',
                    iconData: Icons.shopping_cart,
                  ),
                  CardHistoryIkan(),
                  CardHistoryIkan(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total jumlah ikan: ',
                        style: subtitleTextStyle,
                      ),
                      Text(
                        '80 Kg',
                        style: primaryTextStyle.copyWith(fontWeight: bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total harga ikan: ',
                        style: subtitleTextStyle,
                      ),
                      Text(
                        'Rp485.000',
                        style: primaryTextStyle.copyWith(fontWeight: bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Biaya pengerjaan ikan: ',
                        style: subtitleTextStyle,
                      ),
                      Text(
                        'Rp190.000',
                        style: primaryTextStyle.copyWith(fontWeight: bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getPropertionateScreenHeight(10),
                  ),
                ],
              ),
              Divider(
                thickness: 2.0,
              ),
              CollapseCard(
                content: [
                  HeaderText(
                    title: 'Kurir Pengantar',
                    iconData: Icons.car_repair,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'OK - JEK EXPRESS',
                              style:
                                  primaryTextStyle.copyWith(fontWeight: bold),
                            ),
                            Text(
                              '30 Kg',
                              style:
                                  subtitleTextStyle.copyWith(fontWeight: light),
                            ),
                            Text(
                              'Rp20.000',
                              style: primaryLightTextStyle.copyWith(
                                  fontWeight: bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                thickness: 2.0,
              ),
              CollapseCard(
                content: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: ',
                        style: primaryLightTextStyle,
                      ),
                      Text(
                        'Rp695.000',
                        style: primaryLightTextStyle.copyWith(fontWeight: bold),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: getPropertionateScreenHeight(20),
              ),
              DefaultButton(
                text: Text(
                  'OK',
                  style: whiteTextStyle,
                ),
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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

class HeaderText extends StatelessWidget {
  const HeaderText({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: kPrimaryColor,
        ),
        SizedBox(
          width: getPropertionateScreenWidht(10),
        ),
        Text(
          title,
          style: primaryTextStyle,
        ),
      ],
    );
  }
}

class CardHistoryIkan extends StatelessWidget {
  const CardHistoryIkan({
    Key? key,
  }) : super(key: key);

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
                          text: '10 Kg',
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
                          text: 'Rp31.000',
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
                          text: 'Fillet',
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
                          text: '10.000 / kg',
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
