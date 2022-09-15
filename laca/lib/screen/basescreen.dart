import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:laca/common.dart';
import 'package:laca/controller/commoncontroller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CommonController controller = Get.put(CommonController());

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.bottomIndex.value == 0
            ? "HOME"
            : controller.bottomIndex.value == 1
                ? "LaCa"
                : "View")),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
              currentIndex: controller.bottomIndex.value,
              onTap: (value) {
                controller.bottomIndex.value = value;
                controller.pageController.animateToPage(value,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              backgroundColor: Colors.transparent,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.house), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.gears), label: "LaCa"),
                BottomNavigationBarItem(
                    icon: Icon(FontAwesomeIcons.code), label: "View")
              ])),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
    );
  }
}
