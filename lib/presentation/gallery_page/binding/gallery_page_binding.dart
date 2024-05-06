import 'package:test_project/core/app_export.dart';

import '../controller/gallery_page_controller.dart';

class GalleryScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GalleryScreenController());
  }
}