import 'package:get/get.dart';
import '../../../globalf.dart';

class AccountController extends GetxController {
  final glb = Globalf();

  RxString sname = ''.obs;
  RxString semail = ''.obs;
  RxString apicontroller = ''.obs;
  var visUrl = true.obs;

  @override
  void onInit() {
    super.onInit();
    apicontroller.value = glb.getkey();
    sname.value = glb.getname();
    semail.value = glb.getemail();

    // sname.value = 'User Name : ${sname.value}';
    // semail.value = 'User Email : ${semail.value}';
    // apicontroller.value = 'Api Key : ${apicontroller.value}';
    // sname.value = sname.value;
    // semail.value = semail.value;
    // apicontroller.value = apicontroller.value;
  }
}
