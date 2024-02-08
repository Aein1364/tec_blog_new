import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog_new/components/api_component.dart';
import 'package:tec_blog_new/components/storage_const.dart';
import 'package:tec_blog_new/services/dio_service.dart';

class VerifyCodeController extends GetxController {
  GetStorage box = GetStorage();
  RxBool loading = false.obs;
  Rx<TextEditingController> verifyCodeController = TextEditingController().obs;
  RxString responseState = ''.obs;
  verifyPostMethode() async {
    loading.value = false;
    Map<String, dynamic> map = {
      'email': box.read(StorageConst.email),
      'user_id': box.read(StorageConst.userId),
      'code': verifyCodeController.value.text,
      'command': 'verify'
    };
    var response = await DioService().postMethode(
        url: ApiComponent.baseUrl + ApiComponent.registerUrl, map: map);
    if (response.statusCode == 200) {
      verifyCodeController.value.clear();
      responseState.value = response.data['response'];
      box.write(StorageConst.token, response.data['token']);
      loading.value = true;
      log(response.data.toString());
      log('token ::: ${box.read(StorageConst.token)}');
      return response.data;
    } else {
      verifyCodeController.value.clear();
      loading.value = true;
      return response.data;
    }
  }
}
