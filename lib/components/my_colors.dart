import 'package:flutter/widgets.dart';

class MyColors {
  static const Color purpleColor = Color(0xff420457);
  static const Color purpleAccentColor = Color(0xff9778AF);
  static const Color dividerColor = Color(0xff707070);
  static List<Color> posterGradientColor = [
    const Color(0xff28292E).withOpacity(0),
    const Color(0xff481458).withOpacity(.5),
    const Color(0xff1C1451).withOpacity(.5),
  ];
  static List<Color> matedGradientColor = [
    const Color(0xffFFFFFF),
    const Color(0xffFFFFFF).withOpacity(.7),
    const Color(0xffFFFFFF).withOpacity(0),
  ];
  static List<Color> tagsGradientColor = [
    const Color(0xff000000),
    const Color(0xff3F3F3F),
  ];
  static List<Color> topVisitedGradientColor = [
    const Color(0xffFFFFFF).withOpacity(0),
    const Color(0xff000000),
  ];
  static List<Color> bottomNavigationGradientColor = [
    const Color(0xff19005E),
    const Color(0xff440457),
  ];
}
