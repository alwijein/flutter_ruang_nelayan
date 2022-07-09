part of 'components.dart';

class CartCard extends StatefulWidget {
  final CartModel cart;
  const CartCard(this.cart);

  @override
  State<CartCard> createState() => _CartCardState();
}

List<String> tags = [];

class _CartCardState extends State<CartCard> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    StateController controller = Get.put(StateController());
    return Container(
      margin: EdgeInsets.only(
        top: getPropertionateScreenWidht(24),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: kBackgroundColor1,
        borderRadius: BorderRadius.circular(12),
        boxShadow: softShadow,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.cart.hasilTangkapanModel!.gambar ??
                          'assets/images/ikan_01.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cart.hasilTangkapanModel!.namaIkan!,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      formatCurrency
                          .format(widget.cart.hasilTangkapanModel!.harga)
                          .toString()
                          .replaceAll(regex, ''),
                      style: priceTextStyle,
                    ),
                    Text(
                      'Nelayan: ${widget.cart.hasilTangkapanModel!.users!.name!}',
                      style: primaryTextStyle,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantity(widget.cart.id!);
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    widget.cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantity(widget.cart.id!);
                    },
                    child: Icon(Icons.remove),
                  ),
                ],
              ),
            ],
          ),
          ChipsChoice<String>.multiple(
            value: tags,
            onChanged: (val) {
              setState(() {
                tags = val;
                cartProvider.addOption(widget.cart.id!, tags);
              });
              // cartProvider.addTags(val);
            },
            choiceItems: C2Choice.listFrom<String, dynamic>(
              source: cartProvider.getOptions(widget.cart.id!),
              value: (i, v) => v.jenisPengerjaan,
              label: (i, v) {
                return cartProvider
                    .getOptions(widget.cart.id!)[i]
                    .jenisPengerjaan
                    .toString();
                // return i.toString();
              },
            ),
            choiceActiveStyle: const C2ChoiceStyle(
              color: kWhiteTextColor,
              backgroundColor: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            choiceStyle: const C2ChoiceStyle(
              showCheckmark: false,
              color: kWhiteTextColor,
              backgroundColor: kSecondaryTextColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            wrapped: true,
          ),
          // const SizedBox(
          //   height: 12,
          // ),
          // GestureDetector(
          //   onTap: () {
          //     cartProvider.removeCart(cart.id!);
          //   },
          //   child: Row(
          //     children: [
          //       const Icon(Icons.remove_shopping_cart),
          //       const SizedBox(
          //         width: 4,
          //       ),
          //       Text(
          //         'Hapus',
          //         style: primaryLightTextStyle.copyWith(
          //           fontSize: 12,
          //           fontWeight: light,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
