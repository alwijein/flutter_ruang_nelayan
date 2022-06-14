import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';
import 'package:flutter_ruang_nelayan/providers/hasil_tangkapan_provider.dart';

class DataHasilTangkapan extends StatelessWidget {
  const DataHasilTangkapan({
    Key? key,
    required this.jumlahIkan,
    required this.totalHarga,
  }) : super(key: key);

  final int jumlahIkan;
  final double totalHarga;

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
          // Row(
          //   children: [
          //     Text('Jenis Ikan yang diperoleh: '),
          //     DefaultButtonGradient(
          //       text: Text(
          //         'Ikan Air Laut',
          //         style: whiteTextStyle,
          //       ),
          //       press: () {},
          //       isInfinity: false,
          //       color1: kColorLightkBlue,
          //       color2: kColorDarkBlue,
          //     ),
          //   ],
          // ),
          RichText(
            text: TextSpan(
              text: 'Jumlah Ikan yang diperoleh: ',
              style: primaryTextStyle,
              children: [
                TextSpan(
                  text: jumlahIkan.toString(),
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
                  text: formatCurrency
                      .format(totalHarga)
                      .toString()
                      .replaceAll(regex, ''),
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
