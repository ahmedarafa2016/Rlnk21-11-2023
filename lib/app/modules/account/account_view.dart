import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/appbar/appbar_custom.dart';
import '../../../widgets/appbar/navigation_drawer.dart';
import 'account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      endDrawer: NavDrawer(),
      appBar: const MyAppBar(appheadr: 'Rlnk.Us - > Account'),
      body: Column(
        children: [
          const Spacer(
            flex: 1, //
          ),
          // logo on Body
          Image.asset('assets/images/splashscreen/rlnk.png'),
          const SizedBox(
            height: 20,
          ),
          // Get Resonse  Email
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                //
                children: [
                  // ----- ----------------user name
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.verified_user_sharp,
                            size: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            controller.sname.value,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // -------------------------- Email
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.email,
                          size: 20,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          controller.semail.value,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ----------------------- Api Key
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.key_sharp,
                          size: 20,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.70,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              controller.apicontroller.value,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 3, //
          ),
        ],
      ),
    );
  }
}
