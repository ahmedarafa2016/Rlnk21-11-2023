import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../globalf.dart';

class RlnkController extends GetxController {
  final glb = Globalf();

  Future<void> initStorage() async {
    await GetStorage.init();
  }

  final formkey = GlobalKey<FormState>();
  final isLoading = false.obs;
  var isPasswordHidden = true.obs;
  var ispincodeHidden = true.obs;
  var visUrl = true.obs;

  String urlhascode = "";

  TextEditingController urlController = TextEditingController();
  TextEditingController urlApiController = TextEditingController();
  TextEditingController titleiController = TextEditingController();
  TextEditingController urlpinController = TextEditingController();

  final Map<String, String> params = {
    'ver': '1',
    'action': 'add',
    'key': '',
    'url': '',
    'title': '',
    'urlpin': '0',
  };

  RxString messageText = ''.obs;
  RxString shortidText = ''.obs;
  RxString qrpics = ''.obs;
  RxString expireText = ''.obs;
  RxString stitle = ''.obs;
  RxString sdata = ''.obs;
  RxString regrlnk = ''.obs;

  @override
  void onInit() {
    super.onInit();
    urlApiController.text = glb.getkey();
    if (glb.getkey() != "") {
      regrlnk.value = '';
      visUrl.value = false;
    } else {
      regrlnk.value = 'Register for Api Key';
      visUrl.value = true;
    }
  }

  // Validate Url Function
  String? validateUrl(String value) {
    String pattern =
        r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
    RegExp regExp = RegExp(pattern);
    bool isURLValid = Uri.parse(value).host.isNotEmpty;
    if (!isURLValid) {
      return 'Please enter valid url --- invallid URL';
    } else if (value.isEmpty) {
      return 'Please enter valid url';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid url';
    }
    return null;
  }

  String? validatepincode(String? value) {
    if (value!.length > 6) {
      return 'Number cannot be longer than 6 digits';
    }
    return null;
  }

// post Url Request
  Future<void> makeHttpRequest() async {
    isLoading.value = true;

    // Validate Url Status
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    //  check is url here
//url + title + key + url pin
    if (urlController.text != '') {
      String calcval = urlController.text +
          urlApiController.text +
          urlpinController.text +
          titleiController.text;
      urlhascode = calcval.toString().hashCode.toRadixString(16);

      if (urlhascode == glb.geturlhash()) {
        isLoading.value = false;
        return;
      }
    }

    clearvar();
    params['url'] = urlController.text;
    params['key'] = urlApiController.text;

    if (titleiController.text != '') {
      params['title'] = titleiController.text;
    }

    if (urlpinController.text != '') {
      params['urlpin'] = urlpinController.text;
    }
    final response = await glb.postData(jsonEncode(params));

    // final jsonResponse = jsonDecode(response);
    final Map<String, dynamic> jsonResponse = jsonDecode(response);

    // succsee
    if (jsonResponse['status'] == "success") {
      // Put Value in Variabe

      expireText.value = jsonResponse['expire'];
      shortidText.value = jsonResponse['slnk'];
      messageText.value = jsonResponse['message'];
      glb.savekey(urlApiController.text);
      glb.saveurlhash(urlhascode);

      glb.geterrmsg(jsonResponse['message']);
      // if (urlpinController.text != '') {
      //   glb.geterrmsg('You make Pin Url');
      // }
      String str = jsonResponse['qrpic'] as String;
      qrpics.value = str.split(',')[1].trim();
      isLoading.value = false;
      if (glb.getkey() != "") {
        regrlnk.value = '';
      } else {
        regrlnk.value = 'Register for Api Key';
      }
    } else {
      glb.geterrmsg(jsonResponse['message']);
      isLoading.value = false;
    }
  }

  void clearvar() {
    shortidText.value = '';
    expireText.value = '';
    messageText.value = '';
    qrpics.value = '';
  }
}
