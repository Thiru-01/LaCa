import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laca/common.dart';
import 'package:laca/controller/commoncontroller.dart';
import 'package:laca/firebase_options.dart';
import 'package:laca/screen/basescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'LaCa',
        onInit: () {
          Get.put(CommonController());
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: primaryMaterialColor,
            fontFamily: GoogleFonts.spaceMono().fontFamily,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                centerTitle: true,
                color: Colors.transparent,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: primaryColor,
                    fontFamily: GoogleFonts.spaceMono().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 21))),
        home: const HomeScreen());
  }
}
