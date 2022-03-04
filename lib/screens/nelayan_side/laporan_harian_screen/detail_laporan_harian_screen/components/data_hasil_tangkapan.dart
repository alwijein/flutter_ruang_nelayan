import 'package:flutter_ruang_nelayan/boostrap.dart';

class DataHasilTangkapan extends StatelessWidget {
  const DataHasilTangkapan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getPropertionateScreenHeight(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Data Hasil Tangkapan',
            style: primaryTextStyle.copyWith(
              fontWeight: bold,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: getPropertionateScreenHeight(16),
          ),
          Row(
            children: [
              Text('Jenis Ikan yang diperoleh: '),
              DefaultButtonGradient(
                text: Text(
                  'Ikan Air Laut',
                  style: whiteTextStyle,
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
              text: 'Jumlah Ikan yang diperoleh: ',
              style: primaryTextStyle,
              children: [
                TextSpan(
                  text: '80 Kg',
                  style: primaryTextStyle.copyWith(fontWeight: bold),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Harga satuan ikan perkilo: ',
              style: primaryTextStyle,
              children: [
                TextSpan(
                  text: 'Rp25.000',
                  style: primaryTextStyle.copyWith(fontWeight: bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
