import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog_new/components/storage_const.dart';
import 'package:tec_blog_new/controller/pick_file_controller.dart';
import 'package:tec_blog_new/services/dio_service.dart';
import 'package:tec_blog_new/services/pick_file_service.dart';

class PostArticleController extends GetxController {
  PickFileController pickFileController = Get.put(PickFileController());

  RxBool loading = true.obs;
  Rx<TextEditingController> articleTitleController =
      TextEditingController().obs;
  Rx<TextEditingController> articleContentController =
      TextEditingController().obs;
  RxList selectedCategoriesList = [].obs;
  RxList selectedCategoriesIdList = [].obs;
  RxString firstTitle =
      'اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن'.obs;
  RxString firstContent =
      '''من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی'''
          .obs;
  Map<String, dynamic> map = Map();
  postArticleMethode() async {
    map = {
      'title': firstTitle.value,
      'content': firstContent.value,
      'cat_id': selectedCategoriesIdList.first,
      'tag_list': '[]',
      'user_id': GetStorage().read(StorageConst.userId),
      'image': await dio.MultipartFile.fromFile(path.value),
      'command': 'store'
    };
    loading.value = false;

    var response = await DioService().postMethode(
        url: 'https://techblog.sasansafari.com/Techblog/api/article/post.php',
        map: map);
    log('response data ::' + response.data.toString());
    if (response.statusCode == 200) {
      loading.value = true;
      Get.snackbar('', ' اطلاعات با موفقیت ارسال گردید',
          backgroundColor: Colors.green, colorText: Colors.white);
      log(map.toString());

      return response.data;
    } else {
      loading.value = true;
      Get.snackbar('', 'خطا در ارسال اطلاعات',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
