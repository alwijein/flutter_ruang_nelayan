import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/tipe_ikan_model.dart';

class TipeIkanProvider with ChangeNotifier {
  List<TipeIkanModel> _tipeIkan = [];

  List<TipeIkanModel> get tipeIkan => _tipeIkan;

  set tipeIkan(List<TipeIkanModel> tipeIkan) {
    _tipeIkan = tipeIkan;
    notifyListeners();
  }

  Future<void> ikanAirTawar() async {
    try {
      List<TipeIkanModel> ikanAirTawar =
          await TipeIkanServices().ikanAirTawar();
      _tipeIkan = ikanAirTawar;
    } catch (e) {
      print(e);
    }
  }

  Future<void> ikanAirLaut() async {
    try {
      List<TipeIkanModel> ikanAirLaut = await TipeIkanServices().ikanAirLaut();
      _tipeIkan = ikanAirLaut;
    } catch (e) {
      print(e);
    }
  }
}
