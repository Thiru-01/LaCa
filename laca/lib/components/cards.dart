import 'package:flutter/material.dart';
import 'package:laca/common.dart';

Widget percentCard(context,
    {required double value,
    required Color color,
    required IconData icon,
    required String name}) {
  return Tooltip(
    message: name,
    child: Container(
      padding: const EdgeInsets.all(constPadding),
      constraints: BoxConstraints(
          maxWidth: getWidth(context) * 0.45,
          maxHeight: getHeight(context) * 0.14),
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 2),
          color: color.withAlpha(10),
          borderRadius: BorderRadius.circular(constRadius)),
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
                    style: TextStyle(
                        color: color,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          Expanded(
              child: SizedBox(
            child: Icon(
              icon,
              color: color,
              size: 35,
            ),
          ))
        ],
      ),
    ),
  );
}

Widget infoCard(context, {required String name}) {
  return Container(
    margin: const EdgeInsets.all(constPadding),
    decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(constRadius),
        boxShadow: [
          BoxShadow(
            color: lightColor.withAlpha(75),
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
          ), //BoxShadow
        ]),
    padding: const EdgeInsets.all(constPadding),
    width: double.infinity,
    height: getHeight(context) * 0.2,
    child: Text(name),
  );
}
