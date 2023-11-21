import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';

import '../../../globalf.dart';

class LnkOPtionController extends GetxController {
  final glb = Globalf();
  String getApikey = "";
  final formkey = GlobalKey<FormState>();
  final isLoading = false.obs;

  TextEditingController titleiController = TextEditingController();
  TextEditingController urlpinController = TextEditingController();

  Map<String, String> params = {
    'ver': '1',
    'action': 'get',
    'key': '',
    'slnk': '',
  };

  RxString messageText = ''.obs;
  RxString getslnk = ''.obs;
  String shortid = Get.arguments['shortid'];
  String slnk = Get.arguments['slnk'];
  RxString shortidText = ''.obs;
  RxString qrpics = ''.obs;
  RxString expireText = ''.obs;

  int enable = Get.arguments['enable'];

  @override
  void onInit() {
    super.onInit();
    getApikey = glb.getkey();
    params['key'] = getApikey;
    params['slnk'] = shortid;
    getslnk.value = '${Get.arguments['slnk']}';
    shortidText.value = '${Get.arguments['slnk']}';

    senddata();
  }

  String? validatepincode(String? value) {
    if (value!.length > 6) {
      return 'Number cannot be longer than 6 digits';
    }
    return null;
  }

  void senddata() async {
    final response = await glb.postData(jsonEncode(params));
    final Map<String, dynamic> jsonResponse = jsonDecode(response);

    if (jsonResponse['status'] == "success") {
      titleiController.text = jsonResponse['title'];
      enable = jsonResponse['enable'];

      expireText.value = jsonResponse['expire'];
      shortidText.value = jsonResponse['slnk'];
      messageText.value = jsonResponse['message'];

      String str = jsonResponse['qrpic'] as String;
      qrpics.value = str.split(',')[1].trim();
      isLoading.value = false;

      glb.geterrmsg(jsonResponse['message']);
    } else {
      glb.geterrmsg(jsonResponse['message']);
    }
  }

  linkstate(String shortid, int state) {
    enable = state;
    params['slnk'] = shortid;
  }

  void statelnk() async {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }

    isLoading.value = true;
    params['action'] = 'update';
    params['slnk'] = shortid;
    params['key'] = glb.getkey();
    params['enable'] = enable.toString();

    if (titleiController.text != '') {
      params['title'] = titleiController.text;
    }

    if (urlpinController.text != '') {
      params['urlpin'] = urlpinController.text;
    }

    final response = await glb.postData(jsonEncode(params));
    final Map<String, dynamic> jsonResponse = jsonDecode(response);

    if (jsonResponse['status'] == "success") {
      // print('response ------------ 2' + response);
      glb.geterrmsg(jsonResponse['message']);
      isLoading.value = false;
    } else {
      glb.geterrmsg(jsonResponse['message']);
      isLoading.value = false;
    }
  }

  // backlnkoptopn(String shortid, String slnk, int enable) {
  //   Get.toNamed(
  //     Routes.recent,
  //     arguments: {
  //       'shortid': shortid,
  //       'slnk': slnk,
  //       'enable': enable,
  //     },
  //   );
  // }

  // lnkGoBack() {
  //   Get.offAllNamed(Routes.recent);
  //   // LnkOPtionController();
  //   // Get.back();
  // }
}
