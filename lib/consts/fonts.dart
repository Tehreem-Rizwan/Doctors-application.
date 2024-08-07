import 'package:doctorsapp/consts/const.dart';

class AppFonts {
  static String Nunito = "Nunito-Regular", NunitoBold = "Nunito-Bold";
}

class AppSizes {
  static const size12 = 12.0,
      size14 = 14.0,
      size16 = 16.0,
      size18 = 18.0,
      size20 = 20.0,
      size22 = 22.0,
      size34 = 34.0;
}

class AppStyles {
  static Widget regular({
    required String title,
    Color color = Colors.black,
    double size = 14.0,
    TextAlign alignment = TextAlign.left,
  }) {
    return title.text
        .size(size)
        .color(color)
        .align(alignment)
        .fontFamily(AppFonts.Nunito)
        .make();
  }

  static Widget bold({
    required String title,
    Color color = Colors.black,
    double size = 14.0,
    TextAlign alignment = TextAlign.left,
  }) {
    return title.text
        .size(size)
        .color(color)
        .fontFamily(AppFonts.NunitoBold)
        .align(alignment)
        .make();
  }
}
