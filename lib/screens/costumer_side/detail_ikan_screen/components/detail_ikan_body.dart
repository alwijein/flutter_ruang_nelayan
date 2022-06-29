import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';
import 'package:flutter_ruang_nelayan/providers/cart_provider.dart';
import 'package:flutter_ruang_nelayan/providers/hasil_tangkapan_provider.dart';
import 'package:get/get.dart';

class DetailIkanBody extends StatelessWidget {
  const DetailIkanBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HasilTangkapanProvider hasilTangkapanProvider =
        Provider.of<HasilTangkapanProvider>(context);

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: getPropertionateScreenHeight(300),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/ikan_01.png'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: getPropertionateScreenHeight(550),
                decoration: const BoxDecoration(
                  color: kBackgroundColor1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.only(
                  top: defaultPadding,
                  left: defaultPadding,
                  right: defaultPadding,
                ),
                child: ListView(
                  children: hasilTangkapanProvider.hasilTangkapan
                      .map(
                        (hasil) => ListDetailIkan(
                          hasilTangkapanModel: hasil,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListDetailIkan extends StatelessWidget {
  const ListDetailIkan({
    Key? key,
    required this.hasilTangkapanModel,
  }) : super(key: key);

  final HasilTangkapanModel hasilTangkapanModel;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  NetworkImage(hasilTangkapanModel.gambar.toString()),
              radius: getPropertionateScreenWidht(25),
            ),
            SizedBox(
              width: getPropertionateScreenWidht(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hasilTangkapanModel.users!.name.toString(),
                  style: primaryLightTextStyle,
                ),
                Text(
                  formatCurrency
                          .format(hasilTangkapanModel.harga)
                          .toString()
                          .replaceAll(regex, '') +
                      ' / Kg',
                  style: subtitleTextStyle,
                ),
              ],
            ),
            const Spacer(),
            DefaultButton(
                isInfinity: false,
                width: getPropertionateScreenWidht(40),
                text: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.add_shopping_cart,
                      color: kBackgroundColor1,
                      size: getPropertionateScreenWidht(15),
                    ),
                    Text(
                      'Beli',
                      style: whiteTextStyle.copyWith(
                        fontWeight: bold,
                      ),
                    )
                  ],
                ),
                press: () {
                  cartProvider.addCart(hasilTangkapanModel);
                  Get.defaultDialog(
                      title: 'Berhasil',
                      middleText: 'Ikan Berhasil Dimasukkan Ke Keranjang',
                      textConfirm: 'Lihat Keranjang',
                      confirmTextColor: kWhiteTextColor,
                      onConfirm: () {
                        Get.offNamed('/cart');
                      });
                }),
          ],
        ),
        const Divider(
          thickness: 1.3,
        ),
      ],
    );
  }
}
