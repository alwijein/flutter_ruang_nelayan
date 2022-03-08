import 'package:flutter_ruang_nelayan/boostrap.dart';

class ListPesanan extends StatelessWidget {
  const ListPesanan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CollapseCard(
      content: [
        HeaderTextIcon(
          title: 'List Pesanan',
          icon: Icons.shopping_cart,
        ),
        CardIkan(
          qty: '10',
          harga: '20.000',
          jasa: 'Fillet',
          hargaPengerjaan: '10.000',
          total: '300.000',
        ),
      ],
    );
  }
}
