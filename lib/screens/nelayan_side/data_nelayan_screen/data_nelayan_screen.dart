import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/screens/nelayan_side/data_nelayan_screen/components/data_nelayan_body.dart';

class DataNelayanScreen extends StatelessWidget {
  const DataNelayanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: DataNelayanBody(),
    );
  }
}
