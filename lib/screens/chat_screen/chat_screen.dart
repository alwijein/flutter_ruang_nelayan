import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/providers/auth_provider.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: kBackgroundColor1,
        centerTitle: true,
        title: Text(
          'Layanan Pesan',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyChat() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: kBackgroundColor2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/icon_headset.png',
                width: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Opss belum ada pesan?',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Kau belum pernah melakukan transaksi',
                style: secondaryTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 44,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Explore Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          margin: EdgeInsets.all(getPropertionateScreenWidht(24)),
          width: double.infinity,
          child: ListView(
            children: authProvider.listUser
                .map(
                  (hasil) => ChatTile(
                    listUser: hasil,
                  ),
                )
                .toList(),
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
