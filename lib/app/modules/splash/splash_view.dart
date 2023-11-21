import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widgets/gradientrlnk.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //App bar
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Rlnk.Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          flexibleSpace: const CradientRlnk(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/splashscreen/rlnk.png'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
