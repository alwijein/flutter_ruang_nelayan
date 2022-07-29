import 'package:get/get.dart';

class CounterController extends GetxController {
  var jumlah = 0.obs;

  void incrementJumlah() => jumlah++;

  void decrementJumlah() => jumlah--;

  var idJenisIkan = 0.obs;

  void setIdJenisIkan(int id) {
    idJenisIkan.value = id;
  }

  void resetAll() {
    jumlah.value = 0;
    idJenisIkan.value = 0;
  }
}
