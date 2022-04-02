import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/transaction_model.dart';
import 'package:flutter_ruang_nelayan/providers/transaction_provider.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/components/alamat_pengantaran.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/konfirmasi_pesanan_screen/components/list_pesanan.dart';
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
                image: 'assets/images/ikan_01.png',
                name: transactionModel.user!.name,
                tgl: transactionModel.createdAt.toString(),
                id: transactionModel.id.toString(),
              ),
              AlamatPengantaran(
                alamat: transactionModel.user!.alamat.toString(),
                jalan:
                    'Jl. G. Bawakaraeng No. 68, Kec. Sinjai Utara, Kel. Balangnipa',
                kota: 'Sinjai',
                kabupaten: 'Sulawesi Selatan',
              ),
              CollapseCard(
                content: [
                  HeaderTextIcon(
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
              CardKurir(
                logo: 'assets/images/logo_okjek.png',
                kurir: 'OK - JEK EXPRESS',
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
                        'Rp$totalHarga',
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
                press: () async {
                  if (await transactionProvider.confirmStatus(
                      id: int.parse(transactionModel.id.toString()))) {
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
