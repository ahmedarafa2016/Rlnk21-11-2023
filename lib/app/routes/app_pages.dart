import 'package:get/get.dart';

import '../../test/test_binding.dart';
import '../../test/test_view.dart';
import '../modules/about/about_binding.dart';
import '../modules/about/about_view.dart';
import '../modules/account/account.binding.dart';
import '../modules/account/account_view.dart';
import '../modules/chat/chat_binding.dart';
import '../modules/chat/chat_view.dart';
import '../modules/lnkoption/lnkoption_view.dart';
import '../modules/lnkoption/lnkoption_binding.dart';
import '../modules/onboarding/onboarding_binding.dart';
import '../modules/onboarding/onboarding_view.dart';

import '../modules/recent/recent_binding.dart';
import '../modules/recent/recent_view.dart';
import '../modules/rlnkview/rlnk_view.dart';
import '../modules/rlnkview/rlnk_view_binding.dart';

import '../modules/setting/setting_binding.dart';
import '../modules/setting/setting_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import '../modules/statistics/statistic_binding.dart';
import '../modules/statistics/statistic_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.splash;
  // static const initial = Routes.test;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.rlnk,
      page: () => const RlnkView(),
      binding: RlnkBinding(),
    ),
    GetPage(
      name: _Paths.onboarding,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.setting,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.account,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.chat,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.recent,
      page: () => const RecentView(),
      binding: RecentBinding(),
    ),
    GetPage(
      name: _Paths.statistic,
      page: () => const StatisticView(),
      binding: StatisticBinding(),
    ),
    GetPage(
      name: _Paths.test,
      page: () => const TestView(),
      binding: TestBinding(),
    ),
    GetPage(
      name: _Paths.lnkoption,
      page: () => const LnkOPtionView(),
      binding: LnkOptionBinding(),
    ),
    GetPage(
      name: _Paths.about,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
  ];
}
