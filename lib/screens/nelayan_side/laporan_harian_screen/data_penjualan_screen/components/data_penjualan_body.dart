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
                  HeaderTextIcon(
                    title: 'Ikan yang dibeli',
                    icon: Icons.shopping_cart,
                  ),
                  // CardIkan(),
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
              CardKurir(
                logo: '',
                kurir: 'OK - JEK EXPRESS',
                harga: '20.000',
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
