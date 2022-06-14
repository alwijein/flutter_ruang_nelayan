part of 'components.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard(this.cart);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        top: getPropertionateScreenWidht(24),
      ),
      padding: EdgeInsets.symmetric(
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
                      cart.hasilTangkapanModel!.gambar ??
                          'assets/images/ikan_01.png',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cart.hasilTangkapanModel!.namaIkan!,
                      style: primaryTextStyle.copyWith(
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      formatCurrency
                          .format(cart.hasilTangkapanModel!.harga)
                          .toString()
                          .replaceAll(regex, ''),
                      style: priceTextStyle,
                    ),
                    Text(
                      'Nelayan: ${cart.hasilTangkapanModel!.users!.name!}',
                      style: primaryTextStyle,
                    ),
                  ],
                ),
              ),
              // Column(
              //   children: [
              //     GestureDetector(
              //       onTap: () {
              //         cartProvider.addQuantity(cart.id!);
              //       },
              //       child: Icon(Icons.add),
              //     ),
              //     SizedBox(
              //       height: 2,
              //     ),
              //     Text(
              //       cart.quantity.toString(),
              //       style: primaryTextStyle.copyWith(
              //         fontWeight: medium,
              //       ),
              //     ),
              //     SizedBox(
              //       height: 2,
              //     ),
              //     GestureDetector(
              //       onTap: () {
              //         cartProvider.reduceQuantity(cart.id!);
              //       },
              //       child: Icon(Icons.remove),
              //     ),
              //   ],
              // ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id!);
            },
            child: Row(
              children: [
                Icon(Icons.remove_shopping_cart),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Hapus',
                  style: primaryLightTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: light,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
