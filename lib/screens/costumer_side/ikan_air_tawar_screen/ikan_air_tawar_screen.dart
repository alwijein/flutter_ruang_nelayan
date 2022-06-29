import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/costumer_side/ikan_air_tawar_screen/components/ikan_air_tawar_body.dart';
import 'package:get/get.dart';

class IkanAirTawarScreen extends StatelessWidget {
  const IkanAirTawarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    String title = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ikan Air $title',
          style: primaryTextStyle,
        ),
      ),
      body: const IkanAirTawarBody(),
    );
  }
}
