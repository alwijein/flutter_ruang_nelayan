import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/transaction_model.dart';
import 'package:flutter_ruang_nelayan/providers/transaction_provider.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/components/alamat_pengantaran.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/components/profile_pembeli.dart';
import 'package:get/get.dart';

class DetailKonfirmasiPesananBody extends StatelessWidget {
  const DetailKonfirmasiPesananBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionModel transactionModel = Get.arguments;

    double totalHarga = transactionModel.totalJasa! +
        double.parse(transactionModel.totalPembayaran.toString()) +
        double.parse(transactionModel.ongkosKirim.toString());

    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    TransactionServices transactionServices = TransactionServices();
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(
            getPropertionateScreenWidht(24),
          ),
          child: Column(
            children: [
              ProfilePembeli(
                image: transactionModel.user!.avatar.toString(),
                name: transactionModel.user!.name.toString(),
                tgl: transactionModel.createdAt.toString(),
                id: transactionModel.id.toString(),
              ),
              AlamatPengantaran(
                alamat: transactionModel.user!.alamat.toString(),
              ),
              CollapseCard(
                content: [
                  const HeaderTextIcon(
                    title: 'List Pesanan',
                    icon: Icons.shopping_cart,
                  ),
                  Column(
                    children: transactionModel.cartModel!
                        .map(
                          (hasil) => CardIkan(
                            cartModel: hasil,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              // CardKurir(
              //   logo: 'assets/images/logo_okjek.png',
              //   kurir: transactionModel.jasaPengantaranModel!.name.toString(),
              //   harga: formatCurrency
              //       .format(transactionModel.jasaPengantaranModel!.biaya)
              //       .toString()
              //       .replaceAll(regex, ''),
              // ),

              CollapseCard(
                content: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tipe Pengantaran: ',
                        style: primaryLightTextStyle,
                      ),
                      Text(
                        transactionModel.tipePengantaran.toString(),
                        style: primaryLightTextStyle.copyWith(fontWeight: bold),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: ',
                        style: primaryLightTextStyle,
                      ),
                      Text(
                        formatCurrency
                            .format(totalHarga)
                            .toString()
                            .replaceAll(regex, ''),
                        style: primaryLightTextStyle.copyWith(fontWeight: bold),
                      ),
                    ],
                  ),
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
                press: () async {
                  if (await transactionProvider.confirmStatus(
                    id: int.parse(
                      transactionModel.id.toString(),
                    ),
                  )) {
                    for (var data in transactionModel.cartModel!) {
                      transactionServices.ediQty(
                        idHasilTangkapan: data.hasilTangkapanModel!.id!,
                        qty: (data.hasilTangkapanModel!.jumlah! -
                            data.quantity!),
                      );
                    }
                    Get.toNamed("/proses-pemesanan-nelayan");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
