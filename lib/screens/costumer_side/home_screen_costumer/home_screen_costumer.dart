import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/costumer_side/home_screen_costumer/components/home_screen_costumer_body.dart';
import 'package:get_storage/get_storage.dart';

class HomeScreenCostumer extends StatelessWidget {
  const HomeScreenCostumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final loginState = GetStorage();

    loginState.write('status', true);
    return Scaffold(
      body: HomeScreenCostumerBody(),
    );
  }
}
