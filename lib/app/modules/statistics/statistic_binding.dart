import 'package:get/get.dart';

import 'statistic_controller.dart';

class StatisticBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StatisticController>(
      StatisticController(),
    );
  }
}
