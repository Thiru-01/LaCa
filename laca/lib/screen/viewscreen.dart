import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/ascetic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:laca/common.dart';
import 'package:laca/controller/commoncontroller.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CommonController commonController = Get.find();
    return commonController.response != null
        ? SingleChildScrollView(
            padding: const EdgeInsets.all(constPadding),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(Get.width * 0.3, Get.height * 0.05)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Proceed"),
                          Icon(Icons.print_outlined)
                        ],
                      ),
                    ),
                    SizedBox(
                        width: Get.width * 0.6,
                        child: Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2),
                                child: const LinearProgressIndicator(
                                  value: 0.0,
                                  minHeight: 7,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const Text(
                              "0%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            )
                          ],
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: constPadding, bottom: constPadding),
                  child: Text(
                    "Output".toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: primaryColor,
                      letterSpacing: 1,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(constRadius),
                  child: SizedBox(
                    height: Get.height * 0.4,
                    width: double.infinity,
                    child: SvgPicture.string(commonController.response!['svg'],
                        fit: BoxFit.cover),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: constPadding, bottom: constPadding),
                  child: Text(
                    "Code".toUpperCase(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: primaryColor,
                      letterSpacing: 1,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: HighlightView(
                        convertString(commonController.response!['contents']),
                        language: 'gcode',
                        theme: asceticTheme,
                        padding: const EdgeInsets.all(0),
                      ),
                    ),
                  ],
                ),
              ],
            ))
        : SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Please send the query to server for processing",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20, color: Colors.grey, letterSpacing: 1),
                )
              ],
            ),
          );
  }
}

String convertString(List<dynamic> rawList) {
  String result = "";
  for (var element in rawList) {
    result = "$result$element\n";
  }

  return result;
}
