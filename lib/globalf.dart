import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class Globalf {
  final store = GetStorage();

  Globalf() {
    //initsub();
  }

  initsub() async {
    await GetStorage.init();
  }

  getkey() {
    String key = "";
    if (store.read('userApiKey') != null) {
      key = store.read('userApiKey');
    }
    return key;
  }

  savekey(String key) {
    store.write('userApiKey', key);
  }

  geturlhash() {
    String key = '';
    if (store.read('userUrlhash') != null) {
      key = store.read('userUrlhash');
    }
    //if (key == null) return "";
    return key;
  }

  saveurlhash(String hash) {
    store.write('userUrlhash', hash);
  }

  removeurlhash(String key) {
    return store.write('userUrlhash', key);
  }

  getname() {
    String key = '';
    if (store.read('username') != null) {
      key = store.read('username');
    }
    //if (key == null) return "";
    return key;
  }

  savename(String hash) {
    store.write('username', hash);
  }

  getemail() {
    String key = '';
    if (store.read('useremail') != null) {
      key = store.read('useremail');
    }
    //if (key == null) return "";
    return key;
  }

  saveemail(String hash) {
    store.write('useremail', hash);
  }

  //  ---------- Chat Gpt Api Key
  getkeyChat() {
    String key = "";
    if (store.read('userChatKey') != null) {
      key = store.read('userChatKey');
    }
    return key;
  }

  savekeyChat(String key) {
    store.write('userChatKey', key);
  }

  postData(String senddata) async {
    final Uri baseUrl = Uri.parse(
      'https://extension.rlnk.us/ext/app.php',
      // 'https://api.rlnk.us/api/api.php',
    );
    // final uri = Uri.parse(url + queryParams.entries.fold('', (prev, e) => prev + '${e.key}=${e.value}&'));
    // final response = await http.post(baseUrl, body: body, headers: headers);
  //final sendbyte = utf8.encode(senddata);
 // final base64Str = base64.encode(sendbyte);
 try {
  final response =
      await https.post(baseUrl, headers: <String, String>{}, body: senddata);
  if (response.statusCode == 200) {
    return response.body.toString();
    
  } else {
    //throw Exception('Failed to post data: ${response.statusCode}');
    return geterrmsg("Fail To Connect ").toString();
  }
} catch (e) {
  throw Exception('Failed to post data: $e');
// return geterrmsg("Fail To Connect ").toString();
}
}

 //   final response =
 //       await http.post(baseUrl, headers: <String, String>{}, body: senddata);
 //   if (response.statusCode == 200) {
 //     return response.body.toString();
 //   } else {
  //    //throw Exception('Failed to post data: ${response.statusCode}');
  //    return geterrmsg("Fail To Connect ").toString();
  //  }
 // }

  geterrmsg(String msg) {
    Get.snackbar(
      msg,
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color.fromARGB(255, 190, 36, 113),
      colorText: Colors.white,
      duration: const Duration(seconds: 4),
      borderRadius: 10,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      icon: const Icon(Icons.error, color: Colors.white),
      shouldIconPulse: false,
      maxWidth: Get.width - 20,
    );
  }

  geterrmsgUrl(String msg) {
    Get.snackbar(
      msg,
      'Click to Register Api Key',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: const Color.fromARGB(255, 190, 36, 113),
      colorText: Colors.white,
      duration: const Duration(seconds: 6),
      borderRadius: 10,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      icon: const Icon(Icons.error, color: Colors.white),
      shouldIconPulse: false,
      maxWidth: Get.width - 20,
      onTap: (snack) {
        Uri url = Uri.parse('https://www.rlnk.us/login/register.php');
        launchUrl(url);
      },
    );
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  openregUrl(bool val, int key) async {
    if (val == true) {
      if (key == 1) {
        Uri url = Uri.parse('https://www.rlnk.us/login/register.php');
        launchUrl(url);
      } else if (key == 2) {
        Uri url = Uri.parse('https://platform.openai.com/api-keys');
        launchUrl(url);
      }
    }
  }

  // Uri url = Uri.parse('https://www.rlnk.us/login/register.php');
  // if (await canLaunchUrl(url)) {
  //   await launchUrl(url);
  // } else {
  //   throw 'Could not launch $url';
  // }
}
