import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../widgets/gradientrlnk.dart';
import '../../routes/app_pages.dart';
import 'chat_controller.dart';
import 'chat_message.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    // apiController.fetchData('Hello World');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.rlnk);
          },
        ),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Rlnk.Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                child: const FaIcon(
                  FontAwesomeIcons.eraser,
                  size: 16,
                ),
                onTap: () {
                  controller.chatMessages.clear();
                },
              ),
            ],
          ),
        ),
        flexibleSpace: const CradientRlnk(),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                'assets/icons/32.png',
              ),
            ),
          ),
        ],

        // actions: [],
      ),
      body: Obx(
        () => SafeArea(
          child: GestureDetector(
            onTap: (() => FocusScope.of(context).requestFocus(FocusNode())),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.chatMessages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            controller.chatMessages[index].chatMessageType ==
                                    ChatMessageType.sender
                                ? Container(
                                    margin: const EdgeInsets.only(right: 0),
                                    child: CircleAvatar(
                                      child: Image.asset(
                                        'assets/chat/saki-s.png',
                                        // color: Colors.white,
                                      ),
                                    ),
                                  )
                                //
                                : Container(
                                    margin: const EdgeInsets.only(right: 0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          child: Image.asset(
                                            'assets/chat/ai-192.png',
                                            // color: Colors.white,
                                          ),
                                        ),
                                        GestureDetector(
                                          child: const Padding(
                                            padding: EdgeInsets.only(
                                              top: 8,
                                            ),
                                            child: Icon(
                                              Icons.share,
                                              size: 21,
                                            ),
                                          ),
                                          onTap: () async {
                                            await Share.share(
                                                controller.chatMessages[index]
                                                    .message,
                                                subject: controller
                                                    .chatMessages[index]
                                                    .message,
                                                sharePositionOrigin:
                                                    const Rect.fromLTRB(
                                                        10, 10, 10, 20));
                                          },
                                        ),
                                        GestureDetector(
                                          child: const Padding(
                                            padding: EdgeInsets.only(top: 8),
                                            child: FaIcon(
                                              FontAwesomeIcons.clipboardList,
                                              size: 21,
                                            ),
                                          ),
                                          onTap: () {
                                            Clipboard.setData(
                                              ClipboardData(
                                                text: controller
                                                    .chatMessages[index]
                                                    .message,
                                              ),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.83,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: controller.chatMessages[index]
                                            .chatMessageType ==
                                        ChatMessageType.sender
                                    ? Colors.blueAccent
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                controller.chatMessages[index].message,
                                style: TextStyle(
                                  color: controller.chatMessages[index]
                                              .chatMessageType ==
                                          ChatMessageType.sender
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
                  height: controller.isLoading ? 80 : 64,
                  child: Column(
                    children: [
                      controller.isLoading
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SpinKitThreeInOut(
                                itemBuilder: (context, index) => DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: index.isEven
                                        ? Colors.blueGrey
                                        : Colors.deepOrange,
                                  ),
                                ),
                                size: 4,
                              ),
                            )
                          : const SizedBox(),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.blueGrey, // darker color
                                  ),
                                  BoxShadow(
                                    color: Colors.white70, // background color
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextField(
                                      minLines: 1,
                                      maxLines: 2,
                                      style: const TextStyle(
                                          color: Colors.blueAccent),
                                      keyboardType: TextInputType.multiline,
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      autocorrect: true,
                                      controller: controller.textController,
                                      onSubmitted: (value) => controller
                                          .fetchData(value.toString()),
                                      onChanged: (value) =>
                                          controller.message = value.toString(),
                                      decoration: const InputDecoration(
                                          hintText: "Type Something...",
                                          hintStyle: TextStyle(
                                              color: Colors.blueAccent),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  IconButton(
                                      icon: const Icon(Icons.send,
                                          color: Colors.blueAccent),
                                      onPressed: () {
                                        controller.fetchData(
                                            controller.message.toString());
                                      })
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
