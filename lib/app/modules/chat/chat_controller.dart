import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../globalf.dart';
import 'chat_message.dart';

// const apiKey = "";

class ChatController extends GetxController {
  final glb = Globalf();

  // static const String chatgptKey;

  final _isLoading = false.obs;
  final _isError = false.obs;
  final _errorMessage = ''.obs;
  final _apiKey = ''.obs;

  bool get isLoading => _isLoading.value;
  bool get isError => _isError.value;
  String get errorMessage => _errorMessage.value;

  String get apiKey => _apiKey.value;

  final textController = TextEditingController();
  final scrollController = ScrollController();

//	https://api.openai.com/v1/chat/completions
  final baseUrl = Uri.https('api.openai.com', 'v1/completions');
//  final baseUrl = Uri.https('api.openai.com', 'v1/chat/completions');

  // Map<String, String> header = {
  //   "Content-Type": "application/json",
  //   "Authorization": "Bearer $apiKey",
  // };

  final _data = ''.obs;
  get data => _data.value;
  set data(value) => _data.value = value;
  void clearData() => _data.value = '';

  final _message = ''.obs;
  get message => _message.value;
  set message(value) => _message.value = value;
  void clearMessage() => _message.value = '';

  final _chatMessages = <ChatMessage>[].obs;
  List<ChatMessage> get chatMessages => _chatMessages;
  set chatMessages(value) => _chatMessages.value = value;

  @override
  void onInit() {
    // fetchData("Hello World");
    super.onInit();

    // print('-------------------' + chatgptKey);
  }

// header( 'Content-Type: application/json; charset=utf-8' );
// "Content-Type": "application/json",
  Map<String, String> getHeader(String key) {
    String auth = "Bearer $key";
    return {
      "Content-Type": "application/json; charset=utf-8",
      "Authorization": auth,
      'Access-Control-Allow-Origin': '*',
    };
  }

  @override
  void onReady() {
    // fetchData("hi");
    super.onReady();
  }

  void scrollDown() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future fetchData(String prompt) async {
    _isLoading.value = true;
    Get.snackbar('Loading', 'Please wait...');

    // add message to chat as sender type.
    _chatMessages.add(ChatMessage(
      // message: prompt.trim(),
      message: prompt.trim(),

      chatMessageType: ChatMessageType.sender,
    ));

    Future.delayed(const Duration(milliseconds: 50)).then((_) => scrollDown());

    isLoading
        ? _chatMessages.add(ChatMessage(
            message: 'Loading, Please wait...',
            chatMessageType: ChatMessageType.bot,
          ))
        : null;

    textController.clear();
    try {
      // print(
      //     '------------------------------------------${jsonEncode(getHeader(glb.getkeyChat()))}');
      final response = await http.post(
        baseUrl,
        headers: getHeader(glb.getkeyChat()),
        body: jsonEncode({
          "model": "gpt-3.5-turbo-instruct",
          "prompt": prompt,
          "temperature": 1,
          "max_tokens": 4000,
          "top_p": 1.0,
          "frequency_penalty": 0.0,
          "presence_penalty": 0.0,
        }),
      );

      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);

        data = utf8.decode(res['choices'][0]['text'].codeUnits,
            allowMalformed: true);

        data != '' ? _chatMessages.remove(_chatMessages.last) : null;

        // add message to chat as bot type.
        _chatMessages.add(ChatMessage(
          message: data.trim(),
          chatMessageType: ChatMessageType.bot,
        ));
        Future.delayed(const Duration(milliseconds: 50))
            .then((_) => scrollDown());
      } else {
        _isError.value = true;
        _errorMessage.value = "Error: ${response.statusCode}";
        Map res = jsonDecode(response.body);
        _chatMessages.remove(_chatMessages.last);
        _chatMessages.add(ChatMessage(
          message: res['error']['message'].toString().trim(),
          chatMessageType: ChatMessageType.bot,
        ));
       // print('---------- ' + res['error']['message']);
      }
    } catch (e) {
      _isError.value = true;
      _errorMessage.value = "Error: $e";
    } finally {
      _isLoading.value = false;
    }
  }
}

// "prom"pt": prompt,

// "suffix": "7 8 9 10",
// "temperature": 0.3,

// "choices": [
//   {
//     "text": " 5 6 7 8 9",
//     "index": 0,
//     "logprobs": null,
//     "finish_reason": "length"
//   }
// ],
