import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../globalf.dart';

class SettingController extends GetxController {
  final glb = Globalf();

  TextEditingController apikey = TextEditingController();
  TextEditingController apichatGpt = TextEditingController();

  final isLoading = false.obs;
  final isLoadingChat = false.obs;
  var isPasswordHidden = true.obs;
  var visUrl = true.obs;
  var visUrlchat = true.obs;
  var isPasswordHiddenchat = true.obs;

  final Map<String, String> params = {
    'ver': '1',
    'action': 'auth',
    'key': '',
  };

  RxString sname = ''.obs;
  RxString semail = ''.obs;
  RxString regsetting = ''.obs;
  RxString regchatsetting = ''.obs;

  @override
  void onInit() {
    super.onInit();
    apikey.text = glb.getkey();
    apichatGpt.text = glb.getkeyChat();

    if (glb.getkey() != "") {
      regsetting.value = '';
      visUrl.value = false;
    } else {
      regsetting.value = 'Register for Api Key';
      visUrl.value = true;
    }

    if (glb.getkeyChat() != "") {
      regchatsetting.value = '';
      visUrlchat.value = false;
    } else {
      regchatsetting.value = 'Register for Chat Api Key';
      visUrlchat.value = true;
    }
  }

// post Url Request
  makeHttpRequest() async {
    if (apikey.text != '') {
      isLoading.value = true;

      params['key'] = apikey.text;
      final response = await glb.postData(jsonEncode(params));
      final jsonResponse = jsonDecode(response);

      // print('------------' + response);
      if (jsonResponse['status'] == "success") {
        semail.value = jsonResponse['email'];
        sname.value = jsonResponse['name'];
        glb.savekey(apikey.text);
        glb.savename(sname.value);
        glb.saveemail(semail.value);
        regsetting.value = '';
        isLoading.value = false;

        glb.geterrmsg(jsonResponse['message']);

        sname.value = 'User Name : ${sname.value}';
        semail.value = 'User Email : ${semail.value}';
      } else {
        glb.geterrmsg(jsonResponse['message']);
        glb.savekey('');
        glb.savename('');
        glb.saveemail('');
        regsetting.value = 'Register for Api Key';
        isLoading.value = false;
      }
    } else {
      glb.geterrmsg('Clear Api Key');

      glb.savekey('');
      glb.savename('');
      glb.saveemail('');
    }
  }

//Add Cht
  chatGptAdd() {
    if (apichatGpt.text != '') {
      isLoadingChat.value = true;
      glb.savekeyChat(apichatGpt.text);
      glb.geterrmsg('Saved ChatGpt Key Data');
      regchatsetting.value = '';
      // print('------------' + glb.getkeyChat());
      isLoadingChat.value = false;
    } else {
      glb.geterrmsg('Clear Chat Gpt Key Data');
      regchatsetting.value = 'Register for Chat Api Key';
      isLoadingChat.value = false;
      visUrlchat.value = false;
      glb.savekeyChat('');
    }
  }
}
