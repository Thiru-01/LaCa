import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laca/screen/homescreen.dart';
import 'package:laca/screen/lacascreen.dart';
import 'package:laca/screen/viewscreen.dart';

Color primaryColor = Colors.black;

Map<int, Color> color = const {
  50: Color.fromARGB(24, 0, 0, 0),
  100: Color.fromRGBO(24, 0, 0, .2),
  200: Color.fromRGBO(24, 0, 0, .3),
  300: Color.fromRGBO(24, 0, 0, .4),
  400: Color.fromRGBO(24, 0, 0, .5),
  500: Color.fromRGBO(24, 0, 0, .6),
  600: Color.fromRGBO(24, 0, 0, .7),
  700: Color.fromRGBO(24, 0, 0, .8),
  800: Color.fromRGBO(24, 0, 0, .9),
  900: Color.fromRGBO(24, 0, 0, 1),
};

const double constPadding = 12;
const double constRadius = 6;

MaterialColor primaryMaterialColor = MaterialColor(Colors.black.value, color);
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
  FontAwesomeIcons.check,
  FontAwesomeIcons.clock,
  FontAwesomeIcons.upload,
  FontAwesomeIcons.xmark
];

List<String> cardNames = [
  "Process Done",
  "Pending Process",
  "On Going Process",
  "Failed Process"
];
