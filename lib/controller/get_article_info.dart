import 'dart:developer';

import 'package:get/get.dart';
import 'package:tec_blog_new/components/api_component.dart';
import 'package:tec_blog_new/models/get_article_info_model.dart';
import 'package:tec_blog_new/services/dio_service.dart';

class GetArticleInfoController extends GetxController {
  RxBool loading = false.obs;
  Rx<InfoArticleInfoModel> infoArticleInfo = InfoArticleInfoModel().obs;
  RxList<RelatedArticleInfoModel> relatedArticleInfoList = RxList();
  RxList<TagsArticleInfoModel> tagsArticleInfoList = RxList();

  @override
  onInit() {
    super.onInit();
    articleInfoGetMethode(id: '1');
  }

  articleInfoGetMethode({required String id}) async {
    loading.value = false;
    var response = await DioService().getMethode(
        url:
            '${ApiComponent.baseUrl}article/get.php?command=info&id=$id&user_id=1');
    if (response.statusCode == 200) {
      infoArticleInfo.value =
          InfoArticleInfoModel.fromJson(response.data['info']);
      relatedArticleInfoList.clear();
      for (var element in response.data['related']) {
        relatedArticleInfoList.add(RelatedArticleInfoModel.fromJson(element));
      }

      tagsArticleInfoList.clear();
      for (var element in response.data['tags']) {
        tagsArticleInfoList.add(TagsArticleInfoModel.fromJson(element));
      }
      loading.value = true;
      log(response.data.toString());
      return response.data;
    }
  }
}
