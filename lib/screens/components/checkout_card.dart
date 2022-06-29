part of 'components.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;
  const CheckoutCard(this.cart);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: kBackgroundColor1,
        borderRadius: BorderRadius.circular(12),
        boxShadow: softShadow,
      ),
      child: Row(
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
          const SizedBox(
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
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  formatCurrency
                      .format(cart.hasilTangkapanModel!.harga)
                      .toString()
                      .replaceAll(regex, ''),
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            '${cart.quantity} Kg',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
