import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tec_blog_new/components/my_colors.dart';
import 'package:tec_blog_new/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: Get.width / 1.1,
      child: Column(children: [
        SizedBox(
          height: Get.height / 10.5,
        ),
        Assets.img.logo.image(scale: 3),
        SizedBox(
          height: Get.height / 10.5,
        ),
        DrawerItems(
          textTheme: textTheme,
          title: 'پروفایل کاربری',
          onTap: () {},
        ),
        DrawerItems(
          textTheme: textTheme,
          title: 'درباره تک‌بلاگ',
          onTap: () {},
        ),
        DrawerItems(
          textTheme: textTheme,
          title: 'اشتراک گذاری تک بلاگ',
          onTap: () async {
            await Share.share('تک بلاگ رو با دوستانت به اشتراک بزار');
          },
        ),
        DrawerItems(
          textTheme: textTheme,
          title: 'تک‌بلاگ در گیت هاب',
          onTap: () async {
            await launchUrl(
                Uri.parse('https://github.com/sasansafari/techblog'));
          },
        )
      ]),
    );
  }
}

class DrawerItems extends StatelessWidget {
  DrawerItems({
    super.key,
    required this.textTheme,
    required this.title,
    required this.onTap,
  });

  final TextTheme textTheme;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Divider(
          endIndent: 20,
          indent: 20,
          thickness: 1,
          color: MyColors.dividerColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            splashColor: MyColors.purpleColor.withOpacity(0.3),
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                alignment: Alignment.center,
                width: Get.width,
                child: Text(title,
                    style: textTheme.headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 17)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
