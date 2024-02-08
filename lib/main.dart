import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog_new/components/my_colors.dart';
import 'package:tec_blog_new/gen/fonts.gen.dart';
import 'package:tec_blog_new/view/article_info_screen.dart';
import 'package:tec_blog_new/view/empty_state_screen.dart';
import 'package:tec_blog_new/view/new_article_By_cat_screen.dart';
import 'package:tec_blog_new/view/new_article_published_by_me_screen.dart';
import 'package:tec_blog_new/view/new_article_screen.dart';
import 'package:tec_blog_new/view/splash_screen.dart';
import 'package:tec_blog_new/view/wellcome_screen.dart';
import 'package:tec_blog_new/view/write_article_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('fa', 'IR'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              textStyle: const MaterialStatePropertyAll(
                TextStyle(
                    fontFamily: FontFamily.dana,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              backgroundColor:
                  const MaterialStatePropertyAll(MyColors.purpleColor),
              foregroundColor: const MaterialStatePropertyAll(Colors.white),
              fixedSize: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Size(Get.width / 2.3, Get.height / 15);
                } else {
                  return Size(Get.width / 2.5, Get.height / 16.1);
                }
              }),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontFamily: FontFamily.dana,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black),
            titleMedium: TextStyle(
                fontFamily: FontFamily.dana,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.black),
            titleSmall: TextStyle(
                fontFamily: FontFamily.dana,
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.black),
            bodyLarge: TextStyle(
                fontFamily: FontFamily.dana,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Colors.black),
            headlineLarge: TextStyle(
                fontFamily: FontFamily.dana,
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Color(0xff286BB8)),
            labelLarge: TextStyle(
                fontFamily: FontFamily.dana,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Color(0xffffffff)),
            labelMedium: TextStyle(
                fontFamily: FontFamily.dana,
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Color(0xffffffff)),
            labelSmall: TextStyle(
                fontFamily: FontFamily.dana,
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Color(0xffffffff)),
          )),
      home: const SplashScreen(),
      getPages: [
        GetPage(
            name: RoutPage.emptyStateScreen, page: () => EmptyStateScreen()),
        GetPage(name: RoutPage.wellcomeScreen, page: () => WellcomeScreen()),
        GetPage(
            name: RoutPage.newArticleScreen, page: () => NewArticleScreen()),
        GetPage(
            name: RoutPage.newArticlePublishedByMeScreen,
            page: () => NewArticlePublishedByMeScreen()),
        GetPage(
            name: RoutPage.newArticleByCatIdScreen,
            page: () => NewArticleByCatScreen()),
        GetPage(
            name: RoutPage.articleInfoScreen, page: () => ArticleInfoScreen()),
        GetPage(
            name: RoutPage.writeArticleScreen,
            page: () => WriteArticleScreen()),
      ],
    );
  }
}

class RoutPage {
  static String emptyStateScreen = '/emptyStateScreen';
  static String wellcomeScreen = '/wellcomeScreen';
  static String newArticleScreen = '/newArticleScreen';
  static String newArticlePublishedByMeScreen =
      '/newArticlePublishedByMeScreen';
  static String newArticleByCatIdScreen = '/newArticleByCatIdScreen';
  static String articleInfoScreen = '/articleInfoScreen';
  static String writeArticleScreen = '/writeArticleScreen';
}
