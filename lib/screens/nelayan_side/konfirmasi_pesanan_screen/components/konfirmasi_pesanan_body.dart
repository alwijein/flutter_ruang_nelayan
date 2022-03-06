import 'package:flutter_ruang_nelayan/boostrap.dart';

class KonfirmasiPesananBody extends StatelessWidget {
  const KonfirmasiPesananBody({Key? key}) : super(key: key);

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
              ProfilePembeli(),
              AlamatPengantaran(),
              ListPesanan(),
              CardKurir(
                logo: 'assets/images/logo_okjek.png',
                kurir: 'OK - JEK EXPRESS',
                berat: '30',
                harga: '20.000',
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
                  'Proses Pesanan',
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

class ListPesanan extends StatelessWidget {
  const ListPesanan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CollapseCard(
      content: [
        HeaderTextIcon(
          title: 'List Pesanan',
          icon: Icons.shopping_cart,
        ),
        CardIkan(
          qty: '10',
          harga: '20.000',
          jasa: 'Fillet',
          hargaPengerjaan: '10.000',
          total: '300.000',
        ),
      ],
    );
  }
}

class AlamatPengantaran extends StatelessWidget {
  const AlamatPengantaran({
    Key? key,
  }) : super(key: key);

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
              'Rumah',
              style: primaryLightTextStyle.copyWith(fontWeight: bold),
            ),
            Text(
              'Jl. G. Bawakaraeng No. 68, Kec. Sinjai Utara, Kel. Balangnipa',
              style: primaryTextStyle,
            ),
            Text(
              'Sinjai',
              style: primaryTextStyle,
            ),
            Text(
              'Sulawesi Selatan',
              style: primaryTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}

class ProfilePembeli extends StatelessWidget {
  const ProfilePembeli({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CollapseCard(
      content: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diantar Ke',
              style: subtitleTextStyle,
            ),
            SizedBox(
              height: getPropertionateScreenHeight(10),
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/ikan_01.png',
                  ),
                  radius: getPropertionateScreenWidht(25),
                ),
                SizedBox(
                  width: getPropertionateScreenWidht(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sutono',
                      style: primaryLightTextStyle.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'tgl, pesanan: ',
                        style: primaryTextStyle,
                        children: [
                          TextSpan(
                            text: '14-07-2020',
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'ID Pembeli: ',
                        style: primaryTextStyle,
                        children: [
                          TextSpan(
                            text: 'PB-000-001',
                            style: primaryTextStyle.copyWith(
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
