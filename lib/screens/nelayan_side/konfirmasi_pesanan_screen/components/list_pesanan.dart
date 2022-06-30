import 'package:flutter_ruang_nelayan/boostrap.dart';

class ListPesanan extends StatelessWidget {
  const ListPesanan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CollapseCard(
      content: [
        HeaderTextIcon(
          title: 'List Pesanan',
          icon: Icons.shopping_cart,
        ),
        // CardIkan(),
      ],
    );
  }
}
