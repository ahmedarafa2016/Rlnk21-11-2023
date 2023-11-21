import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../globalf.dart';
import '../../../pallete.dart';
import '../../../widgets/appbar/appbar_custom.dart';
import '../../../widgets/appbar/navigation_drawer.dart';
import 'recent_controller.dart';

class RecentView extends GetView<RecentController> {
  const RecentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavDrawer(),
      appBar: const MyAppBar(appheadr: 'Rlnk.Us - > Recent'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 5),
            child: Row(
              children: [
                Obx(
                  () => Text(
                    controller.recentTitile.value,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.70,
                  child: TextFormField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      //  prefixIcon
                      suffixIcon: GestureDetector(
                        child: const Icon(
                          Icons.search,
                          color: Colors.pink,
                          size: 18,
                        ),
                        onTap: () {
                          String valCharge = controller.searchController.text;
                          controller.getsearchres(valCharge);
                        },
                      ),
                      labelText: 'search Domain ! Tilte ! ShortID',
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
                    ),
                    controller: controller.searchController,
                    validator: (value) => controller.validatecharge(value!),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.20,
                child: ElevatedButton(
                  onPressed: () {
                    String valCharge = controller.searchController.text;
                    controller.getsearchres(valCharge);
                  },
                  child: const FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 40.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Pallete.gradient1,
                  Pallete.gradient2,
                  Pallete.gradient3,
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: const Center(
                      child: Text(
                        "ID",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: const Center(
                      child: Text(
                        "Title",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.15,
                    padding: const EdgeInsets.all(4.0),
                    child: const Text(
                      "Hits",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.allrecent.data?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Card(
                          child: ListTile(
                            leading: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.allrecent.data![index].shortid!,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 12,
                                    bottom: 12,
                                  ),
                                  child: Text(controller
                                      .allrecent.data![index].createdate!),
                                ),
                              ],
                            ),
                            title: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      child: FittedBox(
                                        fit: BoxFit.fitWidth,
                                        child: AutoSizeText(
                                          controller
                                              .allrecent.data![index].title!,
                                          maxLines: 1,
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Globalf().launchInBrowser(
                                          Uri.parse(controller
                                              .allrecent.data![index].slnk!),
                                        );
                                      }),
                                ],
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(
                                top: 12,
                                bottom: 12,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // icon Setting to open lnkoption
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.settings,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    onTap: () {
                                      String shortid = controller
                                          .allrecent.data![index].shortid!;
                                      String slnk = controller
                                          .allrecent.data![index].slnk!;
                                      int? enable = controller
                                          .allrecent.data![index].enable!;
                                      controller.openSettingLnk(
                                          shortid, slnk, enable);
                                    },
                                  ),
                                  const Spacer(
                                    flex: 1, //
                                  ),
                                  //icon statistics to open hits
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.bar_chart_sharp,
                                      size: 18,
                                    ),
                                    onTap: () {
                                      String shortid = controller
                                          .allrecent.data![index].shortid!;
                                      String slnk = controller
                                          .allrecent.data![index].slnk!;

                                      if (controller
                                              .allrecent.data![index].clicks! >
                                          0) {
                                        controller.openShortid(shortid, slnk);
                                      } else {
                                        Globalf()
                                            .geterrmsg('No Hits for this link');
                                      }
                                    },
                                  ),
                                  const Spacer(
                                    flex: 1, //
                                  ),
                                  GestureDetector(
                                    child: const FaIcon(
                                      FontAwesomeIcons.clipboardList,
                                      size: 18,
                                    ),
                                    onTap: () {
                                      Clipboard.setData(
                                        ClipboardData(
                                            text: controller
                                                .allrecent.data![index].slnk!),
                                      );
                                    },
                                  ),
                                  //icon urlpin
                                  const Spacer(
                                    flex: 1, //
                                  ),
                                  Icon(
                                    controller.allrecent.data![index].urlpin! ==
                                            '0'
                                        ? null
                                        : Icons.key,
                                    size: 18,
                                    color: Colors.redAccent,
                                  ),
                                  const Spacer(
                                    flex: 1, //
                                  ),
                                  // icon Enabled
                                  Icon(
                                    controller.allrecent.data![index].enable! >
                                            0
                                        ? null
                                        : Icons.disabled_visible,
                                    size: 18,
                                    color: Colors.redAccent,
                                  ),
                                ],
                              ),
                            ),
                            trailing: GestureDetector(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Text(
                                      controller.allrecent.data![index].clicks!
                                          .toString(),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                String shortid =
                                    controller.allrecent.data![index].shortid!;
                                String slnk =
                                    controller.allrecent.data![index].slnk!;

                                if (controller.allrecent.data![index].clicks! >
                                    0) {
                                  controller.openShortid(shortid, slnk);
                                } else {
                                  Globalf().geterrmsg('No Hits for this link');
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
