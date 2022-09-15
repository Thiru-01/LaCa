import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:laca/common.dart';
import 'package:laca/model/processmodel.dart';

Widget percentCard(context,
    {required int value, required IconData icon, required String name}) {
  return Tooltip(
    message: name,
    child: Container(
      padding: const EdgeInsets.all(constPadding),
      constraints: BoxConstraints(
          maxWidth: getWidth(context) * 0.45,
          maxHeight: getHeight(context) * 0.14),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              offset: const Offset(
                5.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ],
          borderRadius: BorderRadius.circular(constRadius)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: double.infinity,
                      child: Center(
                        child: Text(
                          "$value",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                Expanded(
                    child: SizedBox(
                  child: Icon(
                    icon,
                    color: Colors.black,
                    size: 35,
                  ),
                ))
              ],
            ),
          ),
          Text(
            name.toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.w100,
                letterSpacing: 1,
                color: Colors.grey),
          )
        ],
      ),
    ),
  );
}

Widget infoCard(context, {required Map<String, dynamic> snapshot}) {
  ProcessModel data = ProcessModel.fromJson(snapshot);
  return Column(
    children: [
      Container(
        // margin: const EdgeInsets.all(constPadding),
        color: Colors.white,
        padding: const EdgeInsets.all(constPadding),
        width: double.infinity,
        height: getHeight(context) * 0.2,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data.name.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                Container(
                  padding: const EdgeInsets.all(constPadding - 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(constRadius + 10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(25),
                          offset: const Offset(
                            5.0,
                            5.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 2.0,
                        ), //BoxShadow
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ]),
                  child: const Icon(
                    FontAwesomeIcons.hubspot,
                    size: 40,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Status".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                Text(
                  data.status.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                Text(
                  getDate(data.timestamp),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                Text(
                  getTime(data.timestamp),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      const Divider()
    ],
  );
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CircularProgressIndicator(),
        Container(
            margin: const EdgeInsets.only(left: 7),
            child: const Text("Processing...")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

GetSnackBar snackBar(context, {required String text}) {
  return GetSnackBar(
    title: "Warning",
    maxWidth: double.infinity,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(milliseconds: 5000),
    leftBarIndicatorColor: Colors.black,
    icon: const Icon(
      FontAwesomeIcons.info,
      color: Colors.white,
    ),
    message: text,
    borderRadius: constRadius,
  );
}

String getTime(String value) {
  return DateFormat('h:mma')
      .format(DateTime.fromMillisecondsSinceEpoch(int.parse(value)))
      .toUpperCase();
}

String getDate(String value) {
  return DateFormat("dd/MM/yyyy")
      .format(DateTime.fromMillisecondsSinceEpoch(int.parse(value)))
      .toUpperCase();
}
