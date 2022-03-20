import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/costumer_side/ikan_air_tawar_screen/components/ikan_air_tawar_body.dart';

class IkanAirTawarScreen extends StatelessWidget {
  const IkanAirTawarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ikan Air Tawar',
          style: primaryTextStyle,
        ),
      ),
      body: IkanAirTawarBody(),
    );
  }
}
