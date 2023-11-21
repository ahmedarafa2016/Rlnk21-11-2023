import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../globalf.dart';
import '../../../pallete.dart';
import '../../../widgets/gradientrlnk.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../../../widgets/text_field.dart';
import '../../routes/app_pages.dart';
import 'lnkoption_controller.dart';

class LnkOPtionView extends GetView<LnkOPtionController> {
  const LnkOPtionView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //App bar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAllNamed(Routes.recent);
            },
          ),
          centerTitle: true,
          title: const FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                'Rlnk.Us - > OPtion',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )),
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
        body: SingleChildScrollView(
          child: Form(
            key: controller.formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  // logo on Body
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            controller.getslnk.value,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                        ),
                        onTap: () {
                          Globalf().launchInBrowser(
                            Uri.parse(controller.shortidText.value),
                          );
                        }),
                  ),
      
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 10,
                    ),
                    child: CustomTextField(
                      labelText: 'Title - Optional',
                      controller: controller.titleiController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxLength: 6,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Pallete.gradient2,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: 'Pin code',
                            prefixIcon: const Icon(Icons.key)),
                        controller: controller.urlpinController,
                        validator: (value) => controller.validatepincode(value!),
                      ),
                    ),
                  ),
      
                  SizedBox(
                    height: 40,
                    child: LiteRollingSwitch(
                      value: (controller.enable) > 0,
                      width: MediaQuery.of(context).size.width * 0.9,
                      textOn: 'Enable',
                      textOff: 'Disable',
                      colorOn: Colors.greenAccent,
                      colorOff: Colors.redAccent,
                      iconOn: Icons.event_available,
                      iconOff: Icons.disabled_by_default,
                      textSize: 13.0,
                      textOffColor: Colors.black,
                      textOnColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      onChanged: (bool state) {
                        state
                            ? controller.linkstate(controller.shortid, 1)
                            : controller.linkstate(controller.shortid, 0);
                      },
                      onDoubleTap: () {},
                      onSwipe: () {},
                      onTap: () {},
                    ),
                  ),
                  // Button Get Url Shortener
      
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.06,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Pallete.gradient1,
                            Pallete.gradient2,
                            Pallete.gradient3,
                          ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Obx(
                        () => ElevatedButton.icon(
                          onPressed: controller.isLoading.value
                              ? null
                              : () => controller.statelnk(),
                          icon: controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : const Icon(
                                  Icons.save,
                                  size: 30.0,
                                ),
                          label: Text(
                            controller.isLoading.value
                                ? 'processing'
                                : 'Save Url Setting',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
      
                  Obx(() => Row(
                        children: [
                          const Spacer(
                            flex: 4,
                          ),
                          // Get Url and open shortidText when Click
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Uri url =
                                      Uri.parse(controller.shortidText.value);
                                  launchUrl(url);
                                },
                                child: Text(
                                  controller.shortidText.value,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          //Share Icons
                          Column(
                            children: [
                              //Share URL to ather App
                              GestureDetector(
                                onTap: () async {
                                  await Share.share(controller.shortidText.value,
                                      subject: controller.shortidText.value,
                                      sharePositionOrigin:
                                          const Rect.fromLTRB(10, 10, 10, 20));
                                },
                                // Icon Share URL
                                child: Row(
                                  children: [
                                    Icon(
                                        controller.qrpics.isNotEmpty
                                            ? Icons.share
                                            : null,
                                        size: 20)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                        ],
                      )),
      
                  Obx(() => Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              const Spacer(
                                flex: 5,
                              ),
      
                              // Get Qr Code Image
                              Column(
                                children: [
                                  Container(
                                    child: controller.qrpics.isNotEmpty
                                        ? Image.memory(
                                            base64Decode(controller.qrpics.value))
                                        : const Text(
                                            '',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ),
                                ],
                              ),
                              const Spacer(
                                flex: 1,
                              ),
                              // Get Share Qr Code Image to oheer program
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      Uint8List bytes =
                                          base64.decode(controller.qrpics.value);
                                      final documentDirectory =
                                          await getApplicationDocumentsDirectory();
                                      String imagename =
                                          bytes.hashCode.toRadixString(16);
                                      final file = File(
                                          "${documentDirectory.path}/$imagename.png");
                                      file.writeAsBytesSync(bytes);
                                      XFile fileForShare = XFile(file.path);
                                      await Share.shareXFiles([fileForShare],
                                          text: controller.shortidText.value,
                                          subject: "https://rlnk.us/");
                                    },
                                    // Icon Share QrCode
                                    child: Row(
                                      children: [
                                        Icon(
                                            controller.qrpics.isNotEmpty
                                                ? Icons.share
                                                : null,
                                            size: 20)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
      
                              const Spacer(
                                flex: 3,
                              ),
                            ],
                          ),
                        ),
                      )),
      
                  Obx(() => Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Center(
                          child: Text(
                            controller.expireText.value,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
