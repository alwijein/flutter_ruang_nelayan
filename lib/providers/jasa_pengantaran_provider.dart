import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/jasa_pengantaran_model.dart';

class JasaPengantaranProvider with ChangeNotifier {
  List<JasaPengantaranModel> _jasaPengantaran = [];

  List<JasaPengantaranModel> get jasaPengantaran => _jasaPengantaran;

  double _biaya = 0;
  double get biaya => _biaya;

  set jasaPengantaran(List<JasaPengantaranModel> jasaPengantaran) {
    _jasaPengantaran = jasaPengantaran;
    notifyListeners();
  }

  Future<bool> getjasaPengantaran() async {
    try {
      List<JasaPengantaranModel> jasaPengantaran =
          await JasaPengantaranServices().getJasaPengantaran();
      _jasaPengantaran = jasaPengantaran;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  tambahBiaya(double biaya) {
    _biaya = biaya;
    notifyListeners();
  }

  removeBiaya() {
    _biaya = 0;
    notifyListeners();
  }
}
