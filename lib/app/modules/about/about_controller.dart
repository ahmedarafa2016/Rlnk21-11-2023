import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../globalf.dart';

class AboutController extends GetxController {
  final glb = Globalf();

  static var appName = ''.obs;
  static var packageName = ''.obs;
  static var version = ''.obs;
  static var buildNumber = ''.obs;
  RxString regabout = ''.obs;

  @override
  void onInit() {
    // print('---------------------');
    super.onInit();
    getPackageInfo();
    glb.getkey();
    if (glb.getkey() != "") {
      regabout.value = '';
    } else {
      regabout.value = 'Register for Api Key';
    }
  }

  void getPackageInfo() async {
    // print('----------------------');
    final packageInfo = await PackageInfo.fromPlatform();
    appName.value = packageInfo.appName;
    // print(appName.value);
    packageName.value = 'https://www.rlnk.us/';
    // packageName.value = packageInfo.packageName;
    version.value = packageInfo.version;
    buildNumber.value = packageInfo.buildNumber;

    // print('------------------- ${packageName.value}');
  }

  void launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
