import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec_blog_new/components/my_colors.dart';
import 'package:tec_blog_new/controller/get_article_info.dart';
import 'package:tec_blog_new/controller/new_article_by_cat_id_controller.dart';
import 'package:tec_blog_new/main.dart';

class NewArticleByCatScreen extends StatelessWidget {
  NewArticleByCatScreen({super.key});
  NewArticleByCatIdController newArticleByCatIdController =
      Get.put(NewArticleByCatIdController());
  GetArticleInfoController getArticleInfoController =
      Get.put(GetArticleInfoController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(Get.width / 19.5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height / 16.5,
                  width: Get.height / 16.5,
                  decoration: BoxDecoration(
                      color: MyColors.purpleAccentColor,
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'لیست مقاله ها',
                  style: textTheme.titleSmall!
                      .copyWith(color: MyColors.purpleAccentColor),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: Get.height - Get.width / 3,
              child: ListView.builder(
                  itemCount: newArticleByCatIdController.newArticleList.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: index == 0 ? Get.height / 19.5 : Get.height / 40,
                        bottom: index ==
                                newArticleByCatIdController
                                        .newArticleList.length -
                                    1
                            ? Get.height / 19.5
                            : Get.height / 40,
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          await getArticleInfoController.articleInfoGetMethode(
                              id: newArticleByCatIdController
                                  .newArticleList[index].id);
                          Get.toNamed(RoutPage.articleInfoScreen,
                              arguments: newArticleByCatIdController
                                  .newArticleList[index].id);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: Get.width / 4.2,
                              height: Get.width / 4.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: FancyShimmerImage(
                                    imageUrl: newArticleByCatIdController
                                        .newArticleList[index].image,
                                    boxFit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(
                              width: Get.width / 19.5,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    newArticleByCatIdController
                                        .newArticleList[index].title,
                                    style: textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: Get.height / 68,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          newArticleByCatIdController
                                              .newArticleList[index].author,
                                          style: textTheme.titleSmall!
                                              .copyWith(fontSize: 12)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                            newArticleByCatIdController
                                                .newArticleList[index].view,
                                            style: textTheme.titleSmall!
                                                .copyWith(fontSize: 12)),
                                      ),
                                      Text(
                                          newArticleByCatIdController
                                              .newArticleList[index].catName,
                                          style: textTheme.titleSmall!.copyWith(
                                              color: Colors.blue,
                                              fontSize: 12)),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
