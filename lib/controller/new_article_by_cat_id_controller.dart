import 'dart:developer';

import 'package:get/get.dart';
import 'package:tec_blog_new/components/api_component.dart';
import 'package:tec_blog_new/models/new_article.dart';
import 'package:tec_blog_new/services/dio_service.dart';

class NewArticleByCatIdController extends GetxController {
  RxBool loading = false.obs;
  RxList<NewArticleModel> newArticleList = RxList();
  newArticleGetMethode({required String catId}) async {
    loading.value = false;
    var response = await DioService().getMethode(
        url: ApiComponent.baseUrl +
            'article/get.php?command=get_articles_with_cat_id&cat_id=$catId&user_id=1');
    if (response.statusCode == 200) {
      newArticleList.clear();
      for (var element in response.data) {
        newArticleList.add(NewArticleModel.fromJson(element));
      }
      loading.value = true;
      log(response.data.toString());
      return response.data;
    }
  }
}
