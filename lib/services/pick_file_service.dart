import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tec_blog_new/controller/pick_file_controller.dart';

PickFileController pickFileController = Get.put(PickFileController());

RxString name = 'nothing'.obs;
RxString path = 'nothing'.obs;

Future pickFileService() async {
  FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
  if (result != null) {
    pickFileController.imageFile.value = result.files.first;
    name.value = result.files.first.name;
    path.value = result.files.first.path!;
  } else {
    log('no file  picked');
  }
  log(pickFileController.imageFile.value.name);
}
