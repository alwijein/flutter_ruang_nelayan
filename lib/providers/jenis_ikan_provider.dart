import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/jenis_ikan_model.dart';

class JenisIkanProvider with ChangeNotifier {
  List<JenisIkanModel> _jenisIkan = [];

  List<JenisIkanModel> get jenisIkan => _jenisIkan;

  set jenisIkan(List<JenisIkanModel> jenisIkan) {
    _jenisIkan = jenisIkan;
    notifyListeners();
  }

  Future<void> getJenisIkan() async {
    try {
      List<JenisIkanModel> jenisIkan = await JenisIkanServices().getJenisIkan();
      _jenisIkan = jenisIkan;
    } catch (e) {
      print(e);
    }
  }
}
