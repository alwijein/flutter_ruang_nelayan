import 'package:get/get.dart';

class CounterController extends GetxController {
  var jumlah = 0.obs;

  void incrementJumlah() => jumlah++;

  void decrementJumlah() => jumlah--;
}
