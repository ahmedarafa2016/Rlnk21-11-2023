import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/appbar/appbar_custom.dart';
import '../../../widgets/appbar/navigation_drawer.dart';
import 'about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    AboutController controller = Get.put(AboutController());
    List<String> titles = [
      'URL Shortener',
      'Easy Integration',
      'Support QrCode',
      'Digital Cards',
      'Overall Statistics',
      'Short Link Statistics',
    ];

    return SafeArea(
      child: Scaffold(
        endDrawer: NavDrawer(),
        appBar: const MyAppBar(appheadr: 'Rlnk.Us - > About'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Stack(
                      children: [
                        Image.asset(
                          'assets/carousel/${itemIndex + 1}.jpg',
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                            child: Center(
                              child: Text(
                                titles[itemIndex],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    options: CarouselOptions(
                      height: 200,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Text(
                    'App Name: ${AboutController.appName.value}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    child: Text(
                      'Package Name: ${AboutController.packageName.value}',
                      style: const TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    onHover: (value) {},
                    onTap: () async {
                      Uri url = Uri.parse('http://www.rlnk.us');
                      launchUrl(url);
                    },
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Version: ${AboutController.version.value}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Build Number: ${AboutController.buildNumber.value}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 25),
                  // Register for Api Key
                  InkWell(
                    onHover: (value) {},
                    onTap: () async {
                      Uri url =
                          Uri.parse('https://www.rlnk.us/login/register.php');
                      launchUrl(url);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                      ),
                      child: Center(
                        child: Text(
                          controller.regabout.value,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
