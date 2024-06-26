import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/consts/fonts.dart';
import 'package:doctorsapp/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: AppFonts.Nunito),
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
