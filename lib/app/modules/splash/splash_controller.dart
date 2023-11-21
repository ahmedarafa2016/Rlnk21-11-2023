import 'package:get/get.dart';

import '../../../globalf.dart';
import '../../routes/app_pages.dart';

class SplashController extends GetxController {
  //final glb = Globalf();
  @override
  void onInit() {
    super.onInit();
    // print("hash1 " + Globalf().getkey());
    Globalf().removeurlhash('0');
    //print("hash2 " + Globalf().geturlhash());
  }

  @override
  void onReady() {
    super.onReady();

    String key = Globalf().getkey();

    if (key == "") {
      Future.delayed(const Duration(seconds: 6), () {
        Get.offAllNamed(Routes.onboarding);
      });
    } else {
      //print(Key);

      //print('------------------ splash Screen ---------- ');
      // Get.offAllNamed(Routes.rlnk);
      Get.offAllNamed(Routes.rlnk);
    }
  }
  

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
