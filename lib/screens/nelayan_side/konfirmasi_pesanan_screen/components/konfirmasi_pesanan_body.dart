import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/transaction_model.dart';
import 'package:flutter_ruang_nelayan/providers/transaction_provider.dart';
import 'package:get/get.dart';

class KonfirmasiPesananBody extends StatelessWidget {
  const KonfirmasiPesananBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    List<TransactionModel> transactionModel =
        transactionProvider.transactionModel;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: transactionProvider.transactionModel
              .map(
                (hasil) => CardKonfirmasiPesanan(
                  transactionModel: hasil,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class CardKonfirmasiPesanan extends StatelessWidget {
  const CardKonfirmasiPesanan({
    Key? key,
    required this.transactionModel,
  }) : super(key: key);

  final TransactionModel transactionModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        getPropertionateScreenWidht(18),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(
        getPropertionateScreenWidht(24),
      ),
      decoration: BoxDecoration(
        color: kBackgroundColor1,
        borderRadius: BorderRadius.circular(20),
        boxShadow: softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/ikan_01.png'),
                radius: getPropertionateScreenWidht(30),
              ),
              SizedBox(
                width: getPropertionateScreenWidht(10),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactionModel.user!.name.toString(),
                    style: primaryTextStyle.copyWith(fontWeight: bold),
                  ),
                  Text(
                    transactionModel.createdAt.toString(),
                    style: subtitleTextStyle,
                  ),
                  Text(
                    "Total: ${transactionModel.totalPembayaran}",
                    style: primaryLightTextStyle,
                  ),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(
                "/konfirmasi-pesanan-nelayan/detail",
                arguments: transactionModel,
              );
            },
            child: Text(
              'Lihat Pesanan',
              style: primaryLightTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
