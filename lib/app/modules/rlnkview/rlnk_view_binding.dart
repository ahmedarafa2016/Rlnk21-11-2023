import 'package:get/get.dart';

import 'rlnk_view_controller.dart';

class RlnkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RlnkController>(
      RlnkController(),
    );
  }
}
