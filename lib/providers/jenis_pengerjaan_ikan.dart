import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/jasa_pengerjaan_model.dart';

class JenisPengerjaanIkanProvider with ChangeNotifier {
  List<JasaPengerjaanModel> _jenisPengerjaanIkan = [];

  List<JasaPengerjaanModel> get jenisPengerjaanIkan => _jenisPengerjaanIkan;

  set jenisPengerjaanIkan(List<JasaPengerjaanModel> jenisPengerjaanIkan) {
    _jenisPengerjaanIkan = jenisPengerjaanIkan;
    notifyListeners();
  }

  Future<void> getJenisPengerjaanIkan() async {
    try {
      List<JasaPengerjaanModel> jenisPengerjaanIkan =
          await JenisPengerjaanIkanServices().getJenisPengerjaanIkan();
      _jenisPengerjaanIkan = jenisPengerjaanIkan;
    } catch (e) {
      print(e);
    }
  }
}
