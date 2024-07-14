import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/consts/fonts.dart';
import 'package:doctorsapp/res/components/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
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
      theme: ThemeData(fontFamily: AppFonts.Nunito),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
