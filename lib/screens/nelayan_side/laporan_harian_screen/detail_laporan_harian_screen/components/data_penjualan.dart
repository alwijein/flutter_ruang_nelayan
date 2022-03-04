import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/laporan_harian_screen/data_penjualan_screen/data_penjualan_screen.dart';

class DataPenjualan extends StatelessWidget {
  const DataPenjualan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data Penjualan',
          style: primaryTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: getPropertionateScreenHeight(16),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return DataPenjualanScreen();
            }));
          },
          child: Container(
            width: double.infinity,
            height: getPropertionateScreenHeight(130),
            padding: EdgeInsets.symmetric(
                horizontal: getPropertionateScreenWidht(24),
                vertical: getPropertionateScreenHeight(18)),
            decoration: BoxDecoration(
              color: kBackgroundColor1,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ikan_01.png'),
                  radius: getPropertionateScreenWidht(30),
                ),
                SizedBox(
                  width: getPropertionateScreenWidht(16),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'ID Pembeli: ',
                        style: primaryTextStyle,
                        children: [
                          TextSpan(
                            text: 'PB-000-001',
                            style: primaryTextStyle.copyWith(fontWeight: bold),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Sutono',
                      style: primaryLightTextStyle.copyWith(
                        fontWeight: bold,
                      ),
                    ),
                    Text(
                      'Rp695.000',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
