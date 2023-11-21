import 'package:get/get.dart';

import 'lnkoption_controller.dart';

class LnkOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LnkOPtionController>(
      LnkOPtionController(),
    );
  }
}
