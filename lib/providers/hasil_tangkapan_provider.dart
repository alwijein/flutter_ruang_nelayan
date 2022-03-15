import 'package:flutter_ruang_nelayan/boostrap.dart';
import 'package:flutter_ruang_nelayan/models/hasil_tangkapan_model.dart';

class HasilTangkapanProvider with ChangeNotifier {
  List<HasilTangkapanModel> _hasilTangkapan = [];

  List<HasilTangkapanModel> get hasilTangkapan => _hasilTangkapan;

  set hasilTangkapan(List<HasilTangkapanModel> hasilTangkapan) {
    _hasilTangkapan = hasilTangkapan;
    notifyListeners();
  }

  Future<void> getHasilTangkapan(int idUsers) async {
    try {
      List<HasilTangkapanModel> hasilTangkapan =
          await HasilTangkapanServices().getHasilTangkapan(idUsers);
      _hasilTangkapan = hasilTangkapan;
    } catch (e) {
      print(e);
    }
  }
}
