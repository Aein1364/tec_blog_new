import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tec_blog_new/services/pick_file_service.dart';

class PickFileController extends GetxController {
  Rx<PlatformFile> imageFile = PlatformFile(name: name.value, size: 0).obs;
}
