import 'dart:developer';

import 'package:get/get.dart';
import 'package:tec_blog_new/components/api_component.dart';
import 'package:tec_blog_new/models/home_model.dart';
import 'package:tec_blog_new/services/dio_service.dart';

class HomeController extends GetxController {
  RxBool loading = true.obs;
  Rx<Poster> poster = Poster().obs;
  RxList<TopVisited> topVisitedList = RxList();
  RxList<TopPodcasts> topPodcastsList = RxList();
  RxList<Tags> tagsList = RxList();
  RxList<Categories> categoriesList = RxList();
  @override
  onInit() {
    super.onInit();
    getMethod();
  }

  getMethod() async {
    loading.value = false;
    var response = await DioService()
        .getMethode(url: ApiComponent.baseUrl + ApiComponent.homeUrl);
    if (response.statusCode == 200) {
      poster.value = Poster.fromJson(response.data['poster']);
      for (var element in response.data['top_visited']) {
        topVisitedList.add(TopVisited.fromJson(element));
      }
      for (var element in response.data['top_podcasts']) {
        topPodcastsList.add(TopPodcasts.fromJson(element));
      }

      for (var element in response.data['tags']) {
        tagsList.add(Tags.fromJson(element));
      }
      for (var element in response.data['categories']) {
        categoriesList.add(Categories.fromJson(element));
      }
      loading.value = true;
      log(response.data.toString());
      return response.data;
    }
  }
}
