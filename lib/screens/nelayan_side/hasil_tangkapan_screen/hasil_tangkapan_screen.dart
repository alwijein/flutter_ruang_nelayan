import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/hasil_tangkapan_screen/components/hasil_tangkapan_body.dart';

class HasilTangkapanScreen extends StatelessWidget {
  const HasilTangkapanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: HasilTangkapanBody(),
    );
  }
}
