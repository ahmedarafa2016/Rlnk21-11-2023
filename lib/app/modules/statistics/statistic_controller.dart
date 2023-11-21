import 'package:get/get.dart';
import '../../../globalf.dart';
import '../../models/hitsevent_model.dart';
import 'dart:convert';

class StatisticController extends GetxController {
  final glb = Globalf();

  RxString slnk = ''.obs;
  String shortid = Get.arguments['shortid'];

  String getApikey = "";

  var allHitsEventModel = HitsEventModel().obs;
  HitsEventModel get allhits => allHitsEventModel.value;

  final Map<String, String> params = {
    'ver': '1',
    'action': 'hits',
    'key': '',
    'slnk': '',
  };

  @override
  void onInit() {
    super.onInit();
    getApikey = glb.getkey();
    slnk.value = '${Get.arguments['slnk']}';
    makeHttpRequest();
  }

  Future<void> makeHttpRequest() async {
    params['key'] = getApikey;
    params['slnk'] = shortid;
    // params['shortid'] = shortid;

    final response = await glb.postData(jsonEncode(params));

    final Map<String, dynamic> jsonResponse = jsonDecode(response);
    // print('----------------------------------------------------');
    // print('response' + response);
    if (jsonResponse['status'] == "success") {
      HitsEventModel hitsmodel = HitsEventModel.fromJson(jsonResponse);
      allHitsEventModel.value = hitsmodel;
      glb.geterrmsg(jsonResponse['message']);
    } else {
      glb.geterrmsg(jsonResponse['message']);
    }
  }

  lnkGoBack() {
    Get.back();
  }
}
