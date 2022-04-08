import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/transaction_model.dart';
import 'package:flutter_ruang_nelayan/providers/transaction_provider.dart';

class NotifikasiBody extends StatelessWidget {
  const NotifikasiBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);

    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(
          getPropertionateScreenWidht(18),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: transactionProvider.transactionModel
                .map(
                  (hasil) => CardNotifikasi(
                    transactionModel: hasil,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class CardNotifikasi extends StatelessWidget {
  const CardNotifikasi({
    Key? key,
    required this.transactionModel,
  }) : super(key: key);

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    String namaIkan = '';
    for (var item in transactionModel.cartModel!) {
      namaIkan = namaIkan + (item.hasilTangkapanModel!.namaIkan! + ', ');
    }

    return Padding(
      padding: EdgeInsets.only(bottom: getPropertionateScreenHeight(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transactionModel.status == 'SUDAH DI KONFIRMASI'
                    ? 'Pesanan Diproses'
                    : 'Menunggu Konfirmasi',
                style: primaryTextStyle.copyWith(fontWeight: bold),
              ),
              DefaultButton(
                isInfinity: false,
                color: transactionModel.status == 'SUDAH DI KONFIRMASI'
                    ? kPrimaryColor
                    : kColorDarkOrange,
                text: Text(
                  transactionModel.status.toString(),
                  style: whiteTextStyle,
                ),
                press: () {},
              ),
            ],
          ),
          SizedBox(
            height: getPropertionateScreenHeight(24),
          ),
          Text(
            namaIkan,
            style: primaryTextStyle.copyWith(fontWeight: bold),
          ),
          Text(
            'Total Pembayaran: Rp${transactionModel.totalPembayaran}',
            style: primaryTextStyle,
          ),
          Text(
            FormatDate.formatDate(
                    DateTime.parse(transactionModel.createdAt.toString()))
                .toString(),
            style: subtitleTextStyle,
          ),
          SizedBox(
            height: getPropertionateScreenHeight(10),
          ),
          Divider(
            height: getPropertionateScreenHeight(10),
          ),
        ],
      ),
    );
  }
}
