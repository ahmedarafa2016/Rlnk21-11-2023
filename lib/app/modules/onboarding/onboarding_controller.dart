import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import 'onboarding_info.dart';


class OnboardingController extends GetxController {
  late var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  late var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
      Get.toNamed(Routes.rlnk);
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  skipAction() {
    Get.offNamed(Routes.rlnk);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(
      'assets/images/onboarding/URLShortener.png',
      'Rlnk.Us',
      'Add more value to your links, for work or social media links, keep your favorite video or music in a short link under one name "RLNK.US".',
    ),
    OnboardingInfo(
      'assets/images/onboarding/EasyIntegration.png',
      'Easy Integration',
      'Easy integration with any remote application throw JSON API, you can add, update, delete, export, and the statics to your links by integrating with your applications securely.',
    ),
    // OnboardingInfo(
    //     'assets/images/onboarding/SupportQrCode.jpg',
    //     'Support QrCode',
    //     'Orders your favorite meals will be  immediately deliver'),
    // OnboardingInfo(
    //   'assets/images/onboarding/DigitalCards.png',
    //   'Digital Cards',
    //   'We support QR code with every shortened link, you can download or host in servers with the same shortened name and can send it to other people to easy connected',
    // )
  ];
}
