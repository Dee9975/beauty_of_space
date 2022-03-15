import 'package:beauty_of_space/app/controllers/picture_list_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PictureListController());
  }
}
