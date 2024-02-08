import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec_blog_new/components/api_component.dart';
import 'package:tec_blog_new/components/storage_const.dart';
import 'package:tec_blog_new/services/dio_service.dart';

class RegisterController extends GetxController {
  GetStorage box = GetStorage();
  RxBool loading = false.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  RxBool responseState = false.obs;
  registerPostMethode() async {
    loading.value = false;
    Map<String, dynamic> map = {
      'email': emailController.value.text,
      'command': 'register'
    };
    var response = await DioService().postMethode(
        url: ApiComponent.baseUrl + ApiComponent.registerUrl, map: map);
    if (response.statusCode == 200) {
      responseState.value = response.data['response'];
      box.write(StorageConst.userId, response.data['user_id']);
      box.write(StorageConst.email, emailController.value.text);
      loading.value = true;
      log(response.data.toString());
    } else {
      loading.value = true;
      log(response.data.toString());
      log(responseState.toString());
    }
    return response;
  }
}
