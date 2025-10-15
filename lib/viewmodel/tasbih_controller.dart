import 'package:get/get.dart';

class TasbihController extends GetxController {
  // reactive variables
  final RxDouble counter = 0.0.obs;
  final RxDouble progress = 0.0.obs;

  final double maxCount = 33;

  void incrementCounter() {
    if (counter.value < maxCount) {
      counter.value = counter.value + 1;
      progress.value = (counter.value / maxCount) * 100;
    }
  }

  void resetCounter() {
    counter.value = 0.0;
    progress.value = 0.0;
  }
}
