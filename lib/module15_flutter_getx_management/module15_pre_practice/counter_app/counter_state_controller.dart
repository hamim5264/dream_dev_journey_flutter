import 'package:get/get.dart';

class CounterStateController extends GetxController {
  RxInt count = 0.obs;

  countIncrement() {
    count = count + 1;
  }
}
