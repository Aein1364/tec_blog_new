import 'dart:developer';

import 'package:get/get.dart';
import 'package:tec_blog_new/components/api_component.dart';
import 'package:tec_blog_new/models/new_article.dart';
import 'package:tec_blog_new/services/dio_service.dart';

class NewArticleController extends GetxController {
  RxBool loading = false.obs;
  RxList<NewArticleModel> newArticleList = RxList();
  newArticleGetMethode() async {
    loading.value = false;
    var response = await DioService()
        .getMethode(url: ApiComponent.baseUrl + ApiComponent.newArticleUrl);
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
