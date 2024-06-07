import 'package:doctorsapp/consts/const.dart';

class AppFonts {
  static String Nunito = "Nunito-Regular", NunitoBold = "Nunito-Bold";
}

class AppSizes {
  static const size12 = 12,
      size14 = 14.0,
      size16 = 16.0,
      size18 = 18.0,
      size20 = 20.0,
      size22 = 22.0,
      size34 = 34.0;
}

class AppStyles {
  static normal({String? title, Color? color = Colors.black, double? size}) {
    return title!.text.size(size).color(color).make();
  }

  static bold({String? title, Color? color = Colors.black, double? size}) {
    return title!.text
        .size(size)
        .color(color)
        .fontFamily(AppFonts.NunitoBold)
        .make();
  }
}
