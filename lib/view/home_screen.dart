import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog_new/components/my_colors.dart';
import 'package:tec_blog_new/components/widgets/app_bar_widget.dart';
import 'package:tec_blog_new/components/widgets/drawer_widget.dart';
import 'package:tec_blog_new/controller/get_article_info.dart';
import 'package:tec_blog_new/controller/home_controller.dart';
import 'package:tec_blog_new/controller/new_article_by_cat_id_controller.dart';
import 'package:tec_blog_new/controller/new_article_controller.dart';
import 'package:tec_blog_new/gen/assets.gen.dart';
import 'package:tec_blog_new/main.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.homeController,
    required this.textTheme,
  });

  final HomeController homeController;
  final TextTheme textTheme;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  NewArticleController newArticleController = Get.put(NewArticleController());
  NewArticleByCatIdController newArticleByCatIdController =
      Get.put(NewArticleByCatIdController());
  GetArticleInfoController getArticleInfoController =
      Get.put(GetArticleInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerWidget(textTheme: textTheme),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AppBarWidget(
              scaffoldKey: scaffoldKey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 12.4),
              child: Stack(
                children: [
                  Container(
                    height: Get.height / 4.2,
                    width: Get.width,
                    foregroundDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: MyColors.posterGradientColor,
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: FancyShimmerImage(
                        imageUrl: homeController.poster.value.image,
                        boxFit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Get.height / 38.5,
                    right: Get.width / 12.4,
                    left: Get.width / 12.4,
                    child: Text(homeController.poster.value.title,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: textTheme.labelLarge),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 12.5,
            ),
            SizedBox(
              height: Get.height / 22.8,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.tagsList.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 ? Get.width / 12.4 : Get.width / 50,
                          left: index == homeController.tagsList.length - 1
                              ? Get.width / 12.4
                              : Get.width / 50),
                      child: GestureDetector(
                        onTap: () async {
                          await newArticleByCatIdController
                              .newArticleGetMethode(
                                  catId: homeController.tagsList[index].id);
                          Get.toNamed(RoutPage.newArticleByCatIdScreen);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: Get.height / 22.8,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: MyColors.tagsGradientColor,
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              '#  ${homeController.tagsList[index].title}',
                              style: textTheme.labelMedium,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: Get.height / 17.7,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 12.4),
              child: Row(
                children: [
                  Assets.img.icons.pen.image(scale: 2),
                  SizedBox(
                    width: Get.width / 62.07,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await newArticleController.newArticleGetMethode();
                      Get.toNamed(RoutPage.newArticleScreen);
                    },
                    child: Text(
                      'مشاهده داغ ترین نوشته ها ',
                      style: textTheme.headlineLarge,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 39,
            ),
            SizedBox(
              height: Get.height / 3.5,
              child: ListView.builder(
                  itemCount: homeController.topVisitedList.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          right: index == 0 ? Get.width / 12.4 : Get.width / 50,
                          left:
                              index == homeController.topVisitedList.length - 1
                                  ? Get.width / 12.4
                                  : Get.width / 50),
                      child: GestureDetector(
                        onTap: () async {
                          await getArticleInfoController.articleInfoGetMethode(
                              id: homeController.topVisitedList[index].id);
                          Get.toNamed(RoutPage.articleInfoScreen);
                        },
                        child: SizedBox(
                          width: Get.height / 5.5,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: Get.height / 5.5,
                                    width: Get.height / 5.5,
                                    foregroundDecoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(
                                            colors: MyColors
                                                .topVisitedGradientColor,
                                            begin: Alignment.center,
                                            end: Alignment.bottomCenter)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: FancyShimmerImage(
                                        imageUrl: homeController
                                            .topVisitedList[index].image,
                                        boxFit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: Get.height / 63.2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                            homeController
                                                .topVisitedList[index].author,
                                            style: textTheme.labelMedium!
                                                .copyWith(fontSize: 12)),
                                        Text(
                                            'Like ${homeController.topVisitedList[index].view}',
                                            style: textTheme.labelMedium!
                                                .copyWith(fontSize: 12)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: Get.height / 63.2,
                              ),
                              Text(
                                homeController.topVisitedList[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.titleMedium,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
            ),
            SizedBox(
              height: Get.height / 79,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 12.4),
              child: Row(
                children: [
                  Assets.img.icons.microphone.image(scale: 2),
                  SizedBox(
                    width: Get.width / 62.07,
                  ),
                  Text(
                    'مشاهده داغ ترین پادکست ها ',
                    style: textTheme.headlineLarge,
                  )
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 39,
            ),
            SizedBox(
              height: Get.height / 4.5,
              child: ListView.builder(
                  reverse: true,
                  itemCount: homeController.topPodcastsList.length,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: index == 0 ? Get.width / 12.4 : Get.width / 50,
                          right:
                              index == homeController.topPodcastsList.length - 1
                                  ? Get.width / 12.4
                                  : Get.width / 50),
                      child: Column(
                        children: [
                          Container(
                            height: Get.height / 5.8,
                            width: Get.height / 5.8,
                            foregroundDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: FancyShimmerImage(
                                imageUrl: homeController
                                    .topPodcastsList[index].poster,
                                boxFit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height / 59,
                          ),
                          Text(
                            homeController.topPodcastsList[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.titleMedium,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: Get.height / 9,
            )
          ],
        ),
      ),
    );
  }
}
