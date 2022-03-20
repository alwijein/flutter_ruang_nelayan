import 'dart:io';

import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';
import 'package:flutter_ruang_nelayan/models/ikan_air_tawar_model.dart';

class IkanAirTawarProvider with ChangeNotifier {
  List<IkanAirTawarModel> _ikanAirTawar = [];

  List<IkanAirTawarModel> get ikanAirTawar => _ikanAirTawar;

  set ikanAirTawar(List<IkanAirTawarModel> ikanAirTawar) {
    _ikanAirTawar = ikanAirTawar;
    notifyListeners();
  }

  Future<void> getAll() async {
    try {
      List<IkanAirTawarModel> ikanAirTawar =
          await IkanAirTawarSevices().getAll();
      _ikanAirTawar = ikanAirTawar;
    } catch (e) {
      print(e);
    }
  }
}
