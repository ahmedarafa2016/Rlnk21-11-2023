import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../globalf.dart';
import '../../models/recent_model.dart';
import '../../routes/app_pages.dart';

class RecentController extends GetxController {
  final glb = Globalf();
  String getApikey = "";

  final formkey = GlobalKey<FormState>();
  // bool isValid = true;

  TextEditingController searchController = TextEditingController();

  var allRecentModel = RecentModel().obs;
  RecentModel get allrecent => allRecentModel.value;

  final isLoadingrecent = false.obs;
  final RxString shortid = ''.obs;
  final RxString recentTitile = ''.obs;

  Map<String, String> params = {
    'ver': '1',
    'action': 'list',
    'key': '',
  };

  @override
  void onInit() {
    super.onInit();
    getApikey = glb.getkey();
    params['key'] = getApikey;
    recentTitile.value = 'Recently Sites';
    senddata();
  }

  String? validatecharge(String? value) {
    if (value == "") {
      return 'Enter Search Requirement';
    }
    return null;
  }

  getsearchres(String charge) {
    if (charge == "") {
      glb.geterrmsg('Enter Search Requirement');
      return;
    } else {
      params['action'] = 'search';
      params['words'] = charge;
      recentTitile.value = 'Search Result :$charge';
      senddata();
    }
  }

  void senddata() async {
    final response = await glb.postData(jsonEncode(params));
    final Map<String, dynamic> jsonResponse = jsonDecode(response);
    // print('----------------------------------------------------');
    // print('response' + response);
    if (jsonResponse['status'] == "success") {
      // print('response' + response);
      RecentModel recentmodel = RecentModel.fromJson(jsonResponse);
      allRecentModel.value = recentmodel;
      glb.geterrmsg(jsonResponse['message']);
    } else {
      glb.geterrmsg(jsonResponse['message']);
    }
  }

  openShortid(String shortid, String slnk) {
    Get.toNamed(
      Routes.statistic,
      arguments: {
        'shortid': shortid,
        'slnk': slnk,
      },
    );
  }

  openSettingLnk(String shortid, String slnk, int enable) {
    Get.toNamed(
      Routes.lnkoption,
      arguments: {
        'shortid': shortid,
        'slnk': slnk,
        'enable': enable,
      },
    );
  }
}
