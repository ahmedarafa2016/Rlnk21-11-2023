import 'dart:convert';
import 'dart:io';
import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../globalf.dart';
import '../../../pallete.dart';
import '../../../widgets/appbar/appbar_custom.dart';
import '../../../widgets/appbar/navigation_drawer.dart';
import '../../../widgets/text_field.dart';
import 'rlnk_view_controller.dart';

class RlnkView extends GetView<RlnkController> {
  @override
  const RlnkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavDrawer(),
      appBar: const MyAppBar(appheadr: 'Rlnk.Us - > Home'),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: controller.formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                // Image on top Page
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 10,
                    left: 10,
                  ),
                  child: Image.asset(
                    'assets/images/api_lnk.png',
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                //  ------- Start Url TextformField
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: TextFormField(
                    controller: controller.urlController,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
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
                        labelText: 'Url',
                        prefixIcon: const Icon(Icons.add_link_sharp)),
                    validator: (value) => controller.validateUrl(value!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: CustomTextField(
                    labelText: 'Title - Optional',
                    controller: controller.titleiController,
                  ),
                ),
                //  ApI Key TextField
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: AutoSizeTextField(
                        controller: controller.urlApiController,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        obscureText: controller.isPasswordHidden.value,
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
                          labelText: 'API Key',
                          suffixIcon: InkWell(
                            child: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20,
                            ),
                            onTap: () {
                              controller.isPasswordHidden.value =
                                  !controller.isPasswordHidden.value;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //  API Key Textformfield
                ExpansionTile(
                  title: const Text(
                    "Pin Url number",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 15,
                        left: 15,
                      ),
                      child: Obx(
                        () => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: controller.urlpinController,
                            obscureText: controller.ispincodeHidden.value,
                            validator: (value) =>
                                controller.validatepincode(value!),
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.number,
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
                              labelText: 'API Key',
                              suffixIcon: InkWell(
                                child: Icon(
                                  controller.ispincodeHidden.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 20,
                                ),
                                onTap: () {
                                  controller.ispincodeHidden.value =
                                      !controller.ispincodeHidden.value;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
// Register for Api Key
                InkWell(
                  onTap: () async {
                    Globalf().openregUrl(controller.visUrl.value, 1);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 15,
                    ),
                    child: Center(
                      child: InkWell(
                        child: Text(
                          controller.regrlnk.value,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Button Get Url Shortener
                Container(
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
                          : () => controller.makeHttpRequest(),
                      icon: controller.isLoading.value
                          ? const CircularProgressIndicator()
                          : const Icon(
                              Icons.add_link_sharp,
                              size: 30.0,
                            ),
                      label: Text(
                        controller.isLoading.value
                            ? 'processing'
                            : 'Get Url Shortener',
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
                // Get Resonse Text message
                Obx(() => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          controller.messageText.value,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )),
                // Get Resonse URL Shortener - Share Icons
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

                // Get Resonse QrCode Iamge -  Share to other
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
                                            fontSize: 15,
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

                // Get Resonse Text Expire Date
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
    );
  }
}
