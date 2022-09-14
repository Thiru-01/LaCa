import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laca/screen/homescreen.dart';
import 'package:laca/screen/lacascreen.dart';
import 'package:laca/screen/viewscreen.dart';

Color primaryColor = const Color(0xFF16056B);

Map<int, Color> color = const {
  50: Color.fromRGBO(22, 5, 107, .1),
  100: Color.fromRGBO(22, 5, 107, .2),
  200: Color.fromRGBO(22, 5, 107, .3),
  300: Color.fromRGBO(22, 5, 107, .4),
  400: Color.fromRGBO(22, 5, 107, .5),
  500: Color.fromRGBO(22, 5, 107, .6),
  600: Color.fromRGBO(22, 5, 107, .7),
  700: Color.fromRGBO(22, 5, 107, .8),
  800: Color.fromRGBO(22, 5, 107, .9),
  900: Color.fromRGBO(22, 5, 107, 1),
};

const double constPadding = 12;
const double constRadius = 6;

MaterialColor primaryMaterialColor = MaterialColor(0xFF16056B, color);
Color accentColor = const Color(0xffFD9519);
Color lightColor = const Color(0xffB4D7FE);

List<Widget> screens = const [HomeScreen(), LaCaScreen(), ViewScreen()];

double getHeight(context) {
  return MediaQuery.of(context).size.height;
}

double getWidth(context) {
  return MediaQuery.of(context).size.width;
}

List<Color> colors = [
  primaryColor,
  Colors.green,
  Colors.teal,
  Colors.red,
];

List<IconData> icons = [
  FontAwesomeIcons.clipboardCheck,
  FontAwesomeIcons.check,
  FontAwesomeIcons.clock,
  FontAwesomeIcons.xmark
];

List<String> cardNames = [
  "Completed Process",
  "Process Done",
  "On Going Process",
  "Failed Process"
];
