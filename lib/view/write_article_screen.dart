import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog_new/components/my_colors.dart';
import 'package:tec_blog_new/components/storage_const.dart';
import 'package:tec_blog_new/controller/pick_file_controller.dart';
import 'package:tec_blog_new/controller/post_article_controller.dart';
import 'package:tec_blog_new/gen/assets.gen.dart';
import 'package:tec_blog_new/services/pick_file_service.dart';
import 'package:tec_blog_new/view/html_editing_article_screen.dart';

import '../controller/home_controller.dart';

class WriteArticleScreen extends StatelessWidget {
  WriteArticleScreen({super.key});

  PickFileController pickFileController = Get.put(PickFileController());
  PostArticleController postArticleController =
      Get.put(PostArticleController());
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              children: [
                Stack(
                  children: [
                    Container(
                        height: Get.height / 3,
                        width: Get.width,
                        foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: MyColors.posterGradientColor,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                        child:
                            pickFileController.imageFile.value.name == 'nothing'
                                ? Assets.img.noImagePlaceholder
                                    .svg(fit: BoxFit.cover)
                                : Image.file(
                                    File(path.value),
                                    fit: BoxFit.cover,
                                  )),
                    Positioned(
                        top: 10,
                        right: 10,
                        child: Icon(Icons.arrow_back,
                            color: Colors.white, size: 30)),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () async {
                            await pickFileService();
                            log(name.value);
                            log(pickFileController.imageFile.value.toString());
                          },
                          child: Container(
                            width: Get.width / 3.5,
                            height: Get.height / 28,
                            decoration: BoxDecoration(
                              color: MyColors.purpleColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('انتخاب تصویر',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                Icon(Icons.add, color: Colors.white, size: 20)
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Assets.img.icons.pen.image(scale: 2),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.defaultDialog(
                                  titlePadding: EdgeInsets.all(0),
                                  title: '',
                                  content: SizedBox(
                                    width: Get.width,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Assets.img.monkey
                                                  .svg(width: Get.width / 12),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                'لطفا یه عنوان پر معنا و کوتاه انتخاب کن',
                                                style: textTheme.labelSmall!
                                                    .copyWith(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          TextField(
                                            controller: postArticleController
                                                .articleTitleController.value,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                    EdgeInsets.fromLTRB(
                                                        30, 7, 30, 7),
                                                hintText: 'عنوان را وارد کنید',
                                                hintStyle: textTheme.labelSmall!
                                                    .copyWith(
                                                        color: Colors.grey),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                )),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    postArticleController
                                                            .firstTitle.value =
                                                        postArticleController
                                                            .articleTitleController
                                                            .value
                                                            .text;
                                                    Get.back();
                                                  },
                                                  child: Text(
                                                    'تایید',
                                                    style: textTheme.labelSmall!
                                                        .copyWith(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  )),
                                              TextButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    'بعدا',
                                                    style: textTheme.labelSmall!
                                                        .copyWith(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  )),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ));
                            },
                            child: Text('ویرایش عنوان مقاله',
                                style: textTheme.headlineLarge!
                                    .copyWith(fontWeight: FontWeight.w600)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(postArticleController.firstTitle.value,
                          style: textTheme.titleSmall),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => HtmlEditingArticleScreen());
                        },
                        child: Row(
                          children: [
                            Assets.img.icons.pen.image(scale: 2),
                            SizedBox(
                              width: 10,
                            ),
                            Text('ویرایش متن اصلی مقاله',
                                style: textTheme.headlineLarge)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(postArticleController.firstContent.value,
                          style: textTheme.titleSmall),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                              Container(
                                height: Get.height * .85,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20)),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(40.0),
                                      child: Row(
                                        children: [
                                          Assets.img.monkey.svg(height: 30),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                              'دسته بندی هایی که دوست داری رو انتخاب کن',
                                              style: textTheme.titleSmall!
                                                  .copyWith(
                                                      color: MyColors
                                                          .purpleColor)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height / 10,
                                      child: GridView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: homeController
                                              .categoriesList.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  mainAxisSpacing: 20,
                                                  crossAxisSpacing: 15,
                                                  childAspectRatio: .3),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                if (!postArticleController
                                                    .selectedCategoriesList
                                                    .contains(homeController
                                                        .categoriesList[index]
                                                        .title)) {
                                                  postArticleController
                                                      .selectedCategoriesList
                                                      .clear();
                                                  postArticleController
                                                      .selectedCategoriesList
                                                      .add(homeController
                                                          .categoriesList[index]
                                                          .title);
                                                  postArticleController
                                                      .selectedCategoriesIdList
                                                      .clear();
                                                  postArticleController
                                                      .selectedCategoriesIdList
                                                      .add(homeController
                                                          .categoriesList[index]
                                                          .id);

                                                  log(postArticleController
                                                      .selectedCategoriesIdList
                                                      .toString());
                                                }
                                                log(postArticleController
                                                    .selectedCategoriesList
                                                    .toString());
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: Get.height / 22.8,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    gradient: LinearGradient(
                                                        colors: MyColors
                                                            .tagsGradientColor,
                                                        begin: Alignment
                                                            .centerRight,
                                                        end: Alignment
                                                            .centerLeft)),
                                                child: Text(
                                                    '# ${homeController.categoriesList[index].title}',
                                                    style: textTheme.titleSmall!
                                                        .copyWith(
                                                            color:
                                                                Colors.white)),
                                              ),
                                            );
                                          }),
                                    ),
                                    SizedBox(
                                      height: Get.height / 30,
                                    ),
                                    Assets.img.icons.flesh
                                        .svg(width: Get.width / 6),
                                    SizedBox(
                                      height: Get.height / 30,
                                    ),
                                    Obx(() => SizedBox(
                                          height: postArticleController
                                                      .selectedCategoriesList
                                                      .length <=
                                                  3
                                              ? Get.height / 22
                                              : Get.height / 10,
                                          child: GridView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount: postArticleController
                                                  .selectedCategoriesList
                                                  .length,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount:
                                                          postArticleController
                                                                      .selectedCategoriesList
                                                                      .length <=
                                                                  3
                                                              ? 1
                                                              : 2,
                                                      mainAxisSpacing: 20,
                                                      crossAxisSpacing: 15,
                                                      childAspectRatio: .25),
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: Get.height / 22.8,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        color:
                                                            Color(0xffF2F2F2)),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 10),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Text(
                                                              '${postArticleController.selectedCategoriesList[index]}',
                                                              style: textTheme
                                                                  .titleSmall),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              postArticleController
                                                                  .selectedCategoriesList
                                                                  .removeAt(
                                                                      index);
                                                              postArticleController
                                                                  .selectedCategoriesIdList
                                                                  .removeAt(
                                                                      index);
                                                            },
                                                            child: Icon(
                                                              Icons
                                                                  .remove_circle,
                                                              size: 20,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        )),
                                    SizedBox(
                                      height: Get.height / 10,
                                    ),
                                    ElevatedButton(
                                        child: Text(
                                          'تایید',
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        }),
                                  ],
                                ),
                              ),
                              isScrollControlled: true);
                        },
                        child: Row(
                          children: [
                            Assets.img.icons.pen.image(scale: 2),
                            SizedBox(
                              width: 10,
                            ),
                            Text('انتخاب دسته بندی',
                                style: textTheme.headlineLarge),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: Get.height / 22.3,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: postArticleController
                                .selectedCategoriesList.length,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: index == 0 ? 0 : 10,
                                    left: index ==
                                            postArticleController
                                                    .selectedCategoriesList
                                                    .length -
                                                1
                                        ? 0
                                        : 10),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: Get.height / 22.3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                          colors: MyColors.tagsGradientColor,
                                          begin: Alignment.centerRight,
                                          end: Alignment.centerLeft)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                        postArticleController
                                            .selectedCategoriesList[index]
                                            .toString(),
                                        style: textTheme.titleSmall!
                                            .copyWith(color: Colors.white)),
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () async {
                      log(path.value);

                      log(GetStorage().read(StorageConst.token));
                      await postArticleController.postArticleMethode();
                      log(postArticleController.map.toString());
                    },
                    child: postArticleController.loading.value
                        ? Text('ارسال مقاله')
                        : SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
