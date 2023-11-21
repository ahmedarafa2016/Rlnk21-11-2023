import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/app_pages.dart';
import '../../globalf.dart';
import '../../pallete.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer({super.key});
  final glb = Globalf();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: const Color.fromARGB(24, 158, 158, 158),
          child: ListView(
            children: [
              buildDrawerHeader(),
              const Divider(
                color: Color.fromARGB(188, 219, 218, 218),
              ),
              buildDrawerItem(
                icon: Icons.home,
                text: "Home",
                onTap: () => navigate(0),
                tileColor: Get.currentRoute == Routes.rlnk
                    ? const Color.fromARGB(255, 248, 116, 138)
                    : null,
                textIconColor: Get.currentRoute == Routes.rlnk
                    ? Colors.white
                    : Colors.white,
              ),
              buildDrawerItem(
                icon: Icons.account_box_rounded,
                text: "Accout",
                onTap: () => navigate(1),
                tileColor: Get.currentRoute == Routes.account
                    ? const Color.fromARGB(255, 248, 116, 138)
                    : null,
                textIconColor: Get.currentRoute == Routes.account
                    ? Colors.white
                    : Colors.white,
              ),
              buildDrawerItem(
                icon: Icons.flutter_dash_sharp,
                text: "Recent Link",
                onTap: () => navigate(2),
                tileColor: Get.currentRoute == Routes.recent
                    ? const Color.fromARGB(255, 248, 116, 138)
                    : null,
                textIconColor: Get.currentRoute == Routes.recent
                    ? Colors.white
                    : Colors.white,
              ),
              buildDrawerItem(
                icon: Icons.settings,
                text: "Setting",
                onTap: () => navigate(3),
                tileColor: Get.currentRoute == Routes.setting
                    ? const Color.fromARGB(255, 248, 116, 138)
                    : null,
                textIconColor: Get.currentRoute == Routes.setting
                    ? Colors.white
                    : Colors.white,
              ),
              buildDrawerItem(
                  icon: Icons.chat,
                  text: "ChatGpt",
                  onTap: () => navigate(4),
                  tileColor: Get.currentRoute == Routes.chat
                      ? const Color.fromARGB(255, 248, 116, 138)
                      : null,
                  textIconColor: Get.currentRoute == Routes.chat
                      ? Colors.white
                      : Colors.white),
              buildDrawerItem(
                  icon: Icons.info,
                  text: "About",
                  onTap: () => navigate(5),
                  tileColor: Get.currentRoute == Routes.about
                      ? const Color.fromARGB(255, 248, 116, 138)
                      : null,
                  textIconColor: Get.currentRoute == Routes.about
                      ? Colors.white
                      : Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDrawerHeader() {
    return Container(
      height: 80,
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
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Rlnk.us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItem({
    required String text,
    required IconData icon,
    required Color textIconColor,
    required Color? tileColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: textIconColor),
      title: Text(
        text,
        style: TextStyle(
          color: textIconColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      tileColor: tileColor,
      onTap: onTap,
    );
  }

  navigate(int index) {
    if (glb.getkey() != "") {
      if (index == 0) {
        Get.offAllNamed(Routes.rlnk);
      } else if (index == 1) {
        Get.offNamed(Routes.account);
      } else if (index == 2) {
        Get.offNamed(Routes.recent);
      } else if (index == 3) {
        Get.offNamed(Routes.setting);
      } else if (index == 4) {
        Get.offNamed(Routes.chat);
      } else if (index == 5) {
        Get.offNamed(Routes.about);
      }
    } else {
      if (index == 0) {
        Get.offAllNamed(Routes.rlnk);
      } else if (index == 3) {
        Get.offNamed(Routes.setting);
      } else if (index == 5) {
        Get.offNamed(Routes.about);
      } else if (index == 4) {
        if (glb.getkeyChat() != "") {
          Get.offNamed(Routes.chat);
        } else if (glb.getkeyChat() == "") {
          glb.geterrmsg('Enter ChatGpt Api Key');
        }
      } else {
        glb.geterrmsgUrl('Register To Get Api Key');
      }
    }
  }
}
