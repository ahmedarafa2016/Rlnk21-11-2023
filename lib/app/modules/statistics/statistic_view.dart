import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';
import '../../../widgets/gradientrlnk.dart';
import 'statistic_controller.dart';

class StatisticView extends GetView<StatisticController> {
  const StatisticView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              'Rlnk.Us - > Statatistics',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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
        // endDrawer: const NavDrawer(),
        // appBar: const MyAppBar(),
        body: Obx(
          () => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    controller.slnk.value,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                  ),
                ),
              ),
              Expanded(
                child: Obx(() => ListView.builder(
                      itemCount: controller.allhits.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              child: ListTile(
                                leading: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.35,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.allhits.data![index].cbrowser!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        controller.allhits.data![index].timeid!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                title: //
                                    SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    controller.allhits.data![index].cplatform!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                subtitle: Text(
                                  controller.allhits.data![index].aip!,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.07,
                                  child: Text(
                                    controller.allhits.data![index].country!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
        ),
      ),
    );
  }
}
