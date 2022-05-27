import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/controllers/state_controller.dart';
import 'package:flutter_ruang_nelayan/models/jasa_pengantaran_model.dart';
import 'package:flutter_ruang_nelayan/models/jenis_ikan_model.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';
import 'package:flutter_ruang_nelayan/providers/cart_provider.dart';
import 'package:flutter_ruang_nelayan/providers/hasil_tangkapan_provider.dart';
import 'package:flutter_ruang_nelayan/providers/jasa_pengantaran_provider.dart';
import 'package:flutter_ruang_nelayan/providers/transaction_provider.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

enum SingingCharacter { ambilSendiri, pengataran }

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isLoading = false;
  bool isCod = false;
  int selectedValue = 0;

  double biaya = 0;
  SingingCharacter? _character = SingingCharacter.ambilSendiri;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    TransactionServices transactionService = TransactionServices();

    JasaPengantaranProvider jasaPengantaranProvider =
        Provider.of<JasaPengantaranProvider>(context);

    List<JasaPengantaranModel> jasaPengantaran =
        jasaPengantaranProvider.jasaPengantaran;

    StateController stateController = Get.put(StateController());

    TextEditingController jenisIkan = TextEditingController();

    HasilTangkapanProvider hasilTangkapanProvider =
        Provider.of<HasilTangkapanProvider>(context);

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });

      if (isCod) {
        print('Success' + selectedValue.toString());
        if (await transactionProvider.checkout(
          cartProvider.carts,
          int.parse(
              cartProvider.carts[0].hasilTangkapanModel!.users!.id.toString()),
          (cartProvider.totalPrice() +
              cartProvider.totalJasa() +
              jasaPengantaranProvider.biaya),
          authProvider.user.alamat.toString(),
          cartProvider.totalJasa(),
          jasaPengantaranProvider.biaya,
          'Cash or Delivery',
          selectedValue,
        )) {
          stateController.isReset();
          cartProvider.carts = [];
          await hasilTangkapanProvider.getAllHasilTangkapan();
          await Get.offNamed('home-costumer');
        }
      } else {
        String token = await transactionService.getToken(
          cartProvider.totalPrice() +
              cartProvider.totalJasa() +
              jasaPengantaranProvider.biaya,
        );

        Get.toNamed(
          'snap',
          arguments: [
            {'token': token},
            {'carts': cartProvider.carts},
            {'total_harga': cartProvider.totalPrice()},
            {'alamat': authProvider.user.alamat.toString()},
            {'total_jasa': cartProvider.totalJasa()},
            {'ongkos_kirim': jasaPengantaranProvider.biaya},
            {'id_jasa_pengantaran': selectedValue},
            {
              'id_nelayan': cartProvider.carts[0].hasilTangkapanModel!.users!.id
            },
          ],
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: getPropertionateScreenWidht(24),
        ),
        children: [
          // NOTE: LIST ITEMS
          Container(
            margin: EdgeInsets.only(
              top: getPropertionateScreenWidht(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar Keranjang',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                Column(
                  children: cartProvider.carts
                      .map(
                        (cart) => CheckoutCard(cart),
                      )
                      .toList(),
                ),
              ],
            ),
          ),

          // NOTE: ADDRESS DETAILS
          Container(
            margin: EdgeInsets.only(
              top: getPropertionateScreenWidht(24),
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kBackgroundColor1,
              borderRadius: BorderRadius.circular(12),
              boxShadow: softShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Alamat Pengantaran',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/map_icon.svg'),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rumah',
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        ),
                        Text(
                          authProvider.user.alamat ?? 'Belum Di Tambahkan',
                          style: primaryTextStyle.copyWith(
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE: KURIR PENGATARAN
          Container(
            margin: EdgeInsets.only(
              top: getPropertionateScreenWidht(24),
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kBackgroundColor1,
              borderRadius: BorderRadius.circular(12),
              boxShadow: softShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kurir Pengantaran',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text('Ambil Sendiri'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.ambilSendiri,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            jasaPengantaranProvider.removeBiaya();
                            _character = value;
                            stateController.isAmbilSendiri.value = true;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Pengataran'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.pengataran,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) async {
                          if (await jasaPengantaranProvider
                              .getjasaPengantaran()) {
                            setState(() {
                              stateController.isAmbilSendiri.value = false;
                              _character = value;
                            });
                          }
                        },
                      ),
                    ),
                    Obx(
                      () => !stateController.isAmbilSendiri.value
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pilih Kurir Pengantaran",
                                  style: primaryLightTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: bold,
                                  ),
                                ),
                                buildJenisIkan(
                                  jasaPengantaranProvider:
                                      jasaPengantaranProvider,
                                  icon: Icons.water,
                                  input: jenisIkan,
                                  hintText: 'Pilih Kurir',
                                  selected: selectedValue,
                                  jasaPengantaran: jasaPengantaran,
                                ),
                              ],
                            )
                          : SizedBox(),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE: OPSi PEMBAYARAN
          Container(
            margin: EdgeInsets.only(
              top: getPropertionateScreenWidht(24),
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kBackgroundColor1,
              borderRadius: BorderRadius.circular(12),
              boxShadow: softShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Methode Pemabayaran',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isCod,
                      onChanged: (value) {
                        setState(() {
                          isCod = value!;
                        });
                      },
                    ),
                    Text("Cash or Delivery (COD)"),
                  ],
                ),
              ],
            ),
          ),

          // NOTE: PAYMENT SUMMARY
          Container(
            margin: EdgeInsets.only(
              top: getPropertionateScreenWidht(24),
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kBackgroundColor1,
              borderRadius: BorderRadius.circular(12),
              boxShadow: softShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pembayaran',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Keranjang',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalItems()} Items',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Pembayaran',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalPrice()}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Jasa Pengerjaan',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalJasa()}',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Ongkos kirim',
                      style: secondaryTextStyle.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      jasaPengantaranProvider.biaya.toString(),
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xff2E3141),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      '${cartProvider.totalPrice() + cartProvider.totalJasa() + jasaPengantaranProvider.biaya}',
                      style: priceTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // NOTE: CHECKOUT BUTTON
          SizedBox(
            height: getPropertionateScreenWidht(24),
          ),
          Divider(
            thickness: 1,
            color: Color(0xff2E3141),
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: getPropertionateScreenWidht(24),
            ),
            child: TextButton(
              onPressed: handleCheckout,
              style: TextButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Buat Pesanan',
                style: whiteTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor1,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Checkout Details',
        ),
      ),
      body: content(),
    );
  }

  TextFieldContainer buildJenisIkan({
    required TextEditingController input,
    required IconData icon,
    required String hintText,
    required int selected,
    required List<JasaPengantaranModel> jasaPengantaran,
    required JasaPengantaranProvider jasaPengantaranProvider,
  }) {
    return TextFieldContainer(
      isWrapSize: false,
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryLightColor,
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: subtitleTextStyle.copyWith(
            fontSize: 14,
          ),
        ),
        isExpanded: true,
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: jasaPengantaran
            .map((item) => DropdownMenuItem<JasaPengantaranModel>(
                  value: item,
                  child: Text(
                    item.name.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  onTap: () {
                    jasaPengantaranProvider.tambahBiaya(item.biaya ?? 0);
                    selected = item.id!;
                    selectedValue = item.id!;
                  },
                ))
            .toList(),
        onChanged: (value) {
          print('test = ' + selected.toString());
        },
        onSaved: (value) {
          selectedValue = selected;
        },
      ),
    );
  }
}
