import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../globalf.dart';
import '../../../pallete.dart';
import '../../../widgets/appbar/appbar_custom.dart';
import '../../../widgets/appbar/navigation_drawer.dart';
import 'setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      endDrawer: NavDrawer(),
      appBar: const MyAppBar(appheadr: 'Rlnk.Us - > Setting'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              // Start ------ logo on Body
              Image.asset('assets/images/splashscreen/rlnk.png'),
              const SizedBox(
                height: 20,
              ),
              // end ------ logo on Body
              // Start --- Api textformfield
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Obx(
                  () => AutoSizeTextField(
                    controller: controller.apikey,
                    obscureText: controller.isPasswordHidden.value,
                    style: const TextStyle(
                      fontSize: 14,
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
//end  Api textformfield
// start click to Rigester
              InkWell(
                onHover: (value) {},
                onTap: () async {
                  Globalf().openregUrl(controller.visUrl.value, 1);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 15,
                  ),
                  child: Center(
                    child: Obx(
                      () => Text(
                        controller.regsetting.value,
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
              // end click to register
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
                            Icons.save,
                            size: 30.0,
                          ),
                    label: Text(
                      controller.isLoading.value
                          ? 'processing'
                          : 'Save Api Key',
                      style: const TextStyle(
                        fontSize: 16,
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

              // ------ Start Group Chat GPT
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  title: const Text("Enter ChatGpt Api Key"),
                  initiallyExpanded: true,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Obx(
                          () => AutoSizeTextField(
                            controller: controller.apichatGpt,
                            obscureText: controller.isPasswordHiddenchat.value,
                            style: const TextStyle(
                              fontSize: 14,
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
                              labelText: 'API Key',
                              suffixIcon: InkWell(
                                child: Icon(
                                  controller.isPasswordHiddenchat.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 20,
                                ),
                                onTap: () {
                                  controller.isPasswordHiddenchat.value =
                                      !controller.isPasswordHiddenchat.value;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // ------- Start display Rigester ChatGpt
                    Obx(
                      () => InkWell(
                        onTap: () async {
                          Globalf().openregUrl(controller.visUrlchat.value, 2);
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 15,
                            ),
                            child: Text(
                              controller.regchatsetting.value,
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
                    // ------- end display Rigester ChatGpt
                    // ------- Start Buttom to Reg ChatGpt
                    Container(
                      width: MediaQuery.of(context).size.width * 0.87,
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
                          onPressed: controller.isLoadingChat.value
                              ? null
                              : () => controller.chatGptAdd(),
                          icon: controller.isLoadingChat.value
                              ? const CircularProgressIndicator()
                              : const Icon(
                                  Icons.save,
                                  size: 30.0,
                                ),
                          label: Text(
                            controller.isLoadingChat.value
                                ? 'processing'
                                : 'Save Chat GPT',
                            style: const TextStyle(
                              fontSize: 16,
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
                    // ----- End Button Reg Api ChatGpt
                  ],
                ),
              ),
            ],
            // ------ End Group Chat GPT
          ),
        ),
      ),
    );
  }
}
