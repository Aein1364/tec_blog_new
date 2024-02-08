import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog_new/components/my_colors.dart';
import 'package:tec_blog_new/controller/get_article_info.dart';
import 'package:tec_blog_new/controller/new_article_by_cat_id_controller.dart';
import 'package:tec_blog_new/gen/assets.gen.dart';
import 'package:tec_blog_new/main.dart';

class ArticleInfoScreen extends StatelessWidget {
  ArticleInfoScreen({super.key});

  GetArticleInfoController getArticleInfoController =
      Get.put(GetArticleInfoController());
  NewArticleByCatIdController newArticleByCatIdController =
      Get.put(NewArticleByCatIdController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height / 3,
                    width: Get.width,
                    foregroundDecoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.topCenter,
                          colors: MyColors.posterGradientColor),
                    ),
                    child: FancyShimmerImage(
                      imageUrl:
                          getArticleInfoController.infoArticleInfo.value.image,
                      boxFit: BoxFit.cover,
                    ),
                  ),
                  const Positioned(
                    left: 10,
                    top: 5,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.bookmark_outline_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 28,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Column(
                  children: [
                    Text(getArticleInfoController.infoArticleInfo.value.title,
                        style: textTheme.titleLarge),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Assets.img.profile.image(scale: 8),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                            getArticleInfoController
                                .infoArticleInfo.value.author,
                            style: textTheme.titleMedium),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                            getArticleInfoController
                                .infoArticleInfo.value.createdAt,
                            style: textTheme.titleMedium!.copyWith(
                                color: const Color.fromARGB(255, 122, 122, 122),
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      getArticleInfoController.infoArticleInfo.value.content,
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: Get.height / 22.8,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        getArticleInfoController.tagsArticleInfoList.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: index == 0 ? 10 : 5,
                            left: index ==
                                    getArticleInfoController
                                            .tagsArticleInfoList.length -
                                        1
                                ? 10
                                : 5),
                        child: GestureDetector(
                          onTap: () async {
                            await newArticleByCatIdController
                                .newArticleGetMethode(
                                    catId: getArticleInfoController
                                        .tagsArticleInfoList[index].id);
                            Get.toNamed(RoutPage.newArticleByCatIdScreen);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: Get.height / 22.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xffF2F2F2)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                  getArticleInfoController
                                      .tagsArticleInfoList[index].title,
                                  style: textTheme.titleSmall),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Text('نوشته های مرتبط', style: textTheme.headlineLarge),
              ),
              SizedBox(
                height: Get.height / 4.0,
                child: ListView.builder(
                    itemCount:
                        getArticleInfoController.relatedArticleInfoList.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                            right: index == 0 ? 10 : 5,
                            left: index ==
                                    getArticleInfoController
                                            .relatedArticleInfoList.length -
                                        1
                                ? 10
                                : 5),
                        child: GestureDetector(
                          onTap: () async {
                            await getArticleInfoController
                                .articleInfoGetMethode(
                                    id: getArticleInfoController
                                        .relatedArticleInfoList[index].id);
                            Navigator.of(context)
                                .popAndPushNamed(RoutPage.articleInfoScreen);

                            // Get.offNamed(RoutPage.articleInfoScreen);
                          },
                          child: SizedBox(
                            width: Get.height / 5.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: Get.height / 5.5,
                                      width: Get.height / 5.5,
                                      foregroundDecoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          gradient: LinearGradient(
                                              colors: MyColors
                                                  .topVisitedGradientColor,
                                              begin: Alignment.center,
                                              end: Alignment.bottomCenter)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: FancyShimmerImage(
                                          imageUrl: getArticleInfoController
                                              .relatedArticleInfoList[index]
                                              .image,
                                          boxFit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      left: 10,
                                      right: 10,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            getArticleInfoController
                                                .relatedArticleInfoList[index]
                                                .author,
                                            style: textTheme.labelSmall,
                                          ),
                                          Text(
                                            'View ${getArticleInfoController.relatedArticleInfoList[index].view}',
                                            style: textTheme.labelSmall,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  getArticleInfoController
                                      .relatedArticleInfoList[index].title,
                                  style: textTheme.titleSmall,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
