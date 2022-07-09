import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/controllers/state_controller.dart';
import 'package:flutter_ruang_nelayan/models/jasa_pengantaran_model.dart';
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

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isLoading = false;
  bool isCod = false;
  int selectedValue = 0;

  double biaya = 0;
  String? _character = 'Ambil Sendiri';

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    TransactionServices transactionService = TransactionServices();

    JasaPengantaranProvider jasaPengantaranProvider =
        Provider.of<JasaPengantaranProvider>(context);

    StateController stateController = Get.put(StateController());

    HasilTangkapanProvider hasilTangkapanProvider =
        Provider.of<HasilTangkapanProvider>(context);

    TextEditingController name =
        TextEditingController(text: authProvider.user.name);
    TextEditingController nomorTelp =
        TextEditingController(text: authProvider.user.noTelp);
    TextEditingController alamat =
        TextEditingController(text: authProvider.user.alamat);

    handleCheckout() async {
      setState(() {
        isLoading = true;
      });

      if (isCod) {
        print('Success ${cartProvider.getPengerjaanIkan()}');
        if (await transactionProvider.checkout(
          cartProvider.carts,
          int.parse(
              cartProvider.carts[0].hasilTangkapanModel!.users!.id.toString()),
          (cartProvider.totalPrice() +
              cartProvider.totalJasa() +
              jasaPengantaranProvider.biaya),
          authProvider.user.alamat.toString(),
          cartProvider.getPengerjaanIkan(),
          cartProvider.totalJasa(),
          jasaPengantaranProvider.biaya,
          'Cash or Delivery',
          _character ?? 'Ambil Sendiri',
        )) {
          stateController.isReset();
          cartProvider.carts = [];
          await hasilTangkapanProvider.getAllHasilTangkapan();

          Get.snackbar(
            'Berhasil',
            'Pembelian berhasil dilakukan nelayan untuk meproses pembelian anda',
            backgroundColor: kPrimaryColor,
            colorText: kWhiteTextColor,
            margin: EdgeInsets.symmetric(
              vertical: getPropertionateScreenHeight(10),
              horizontal: getPropertionateScreenHeight(24),
            ),
          );
          Get.offNamed('home-costumer');
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
            {'nama_jasa': cartProvider.getPengerjaanIkan()},
            {'total_jasa': cartProvider.totalJasa()},
            {'ongkos_kirim': jasaPengantaranProvider.biaya},
            {'tipe_pengantaran': _character},
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
          InkWell(
            onTap: () {
              Get.defaultDialog(
                title: 'Ubah Alamat Anda',
                onConfirm: () {
                  setState(() async {
                    await authProvider.updateAlamat(
                      name: name.text,
                      noTelp: nomorTelp.text,
                      alamat: alamat.text,
                    );
                  });
                },
                middleText: "Ubah Alamat",
                content: Column(
                  children: [
                    buildFieldInput(
                      'alamat',
                      'Masukkan Alamat Anda',
                      alamat,
                      Icons.place,
                    ),
                  ],
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(
                top: getPropertionateScreenWidht(24),
              ),
              padding: const EdgeInsets.all(20),
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
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/map_icon.svg'),
                      const SizedBox(
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
          ),

          // NOTE: KURIR PENGATARAN
          Container(
            margin: EdgeInsets.only(
              top: getPropertionateScreenWidht(24),
            ),
            padding: const EdgeInsets.all(20),
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
                const SizedBox(
                  height: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text('Ambil Sendiri'),
                      leading: Radio<String>(
                        value: 'Ambil Sendiri',
                        groupValue: _character,
                        onChanged: (String? value) {
                          setState(() {
                            _character = value;
                            print(_character);
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Diantarkan'),
                      leading: Radio<String>(
                        value: 'Diantarkan',
                        groupValue: _character,
                        onChanged: (String? value) {
                          setState(() {
                            _character = value;
                            print(_character);
                          });
                        },
                      ),
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
            padding: const EdgeInsets.all(20),
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
                const SizedBox(
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
                    const Text("Cash or Delivery (COD)"),
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
            padding: const EdgeInsets.all(20),
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
                const SizedBox(
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
                      '${cartProvider.totalKg()} KG',
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
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
                      formatCurrency
                          .format(cartProvider.totalPrice())
                          .toString()
                          .replaceAll(regex, ''),
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
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
                      formatCurrency
                          .format(cartProvider.totalJasa())
                          .toString()
                          .replaceAll(regex, ''),
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
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
                      formatCurrency
                          .format(jasaPengantaranProvider.biaya)
                          .toString()
                          .replaceAll(regex, ''),
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xff2E3141),
                ),
                const SizedBox(
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
                      formatCurrency
                          .format(cartProvider.totalPrice() +
                              cartProvider.totalJasa() +
                              jasaPengantaranProvider.biaya)
                          .toString()
                          .replaceAll(regex, ''),
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
          const Divider(
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
        title: const Text(
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

  TextFieldContainer buildFieldInput(String type, String hintText,
      TextEditingController inputController, IconData icon) {
    return TextFieldContainer(
      isWrapSize: false,
      child: TextFormField(
          style: primaryTextStyle,
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
          keyboardType: TextInputType.text,
          controller: inputController,
          onChanged: (value) {},
          validator: (value) {
            return null;
          }),
    );
  }
}
