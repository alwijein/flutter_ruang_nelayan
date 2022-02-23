import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/home_screen/components/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const Scaffold(
      body: HomeBody(),
    );
  }
}
