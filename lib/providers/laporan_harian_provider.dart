import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/laporan_harian_model.dart';

class LaporanHarianProvider with ChangeNotifier {
  List<LaporanHarianModel> _laporanHarianModel = [];

  List<LaporanHarianModel> get laporanHarianModel => _laporanHarianModel;

  set laporanHarianModel(List<LaporanHarianModel> laporanHarianModel) {
    _laporanHarianModel = laporanHarianModel;
    notifyListeners();
  }

  Future<bool> inputLaporan() async {
    try {
      await LaporanHarianServices().inputLaporan();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> getLaporanHarian() async {
    try {
      List<LaporanHarianModel> laporanHarianModel =
          await LaporanHarianServices().getLaporanHarian();
      _laporanHarianModel = laporanHarianModel;
    } catch (e) {
      print(e);
    }
  }
}
