import 'package:test_project/api_services/pixabay_api.dart';
import 'package:test_project/models/image_model.dart';
import 'package:test_project/widgets/image_view_dialog.dart';

import '../../../core/app_export.dart';
import '../../../main.dart';

class GalleryScreenController extends GetxController {
  TextEditingController searchController = TextEditingController();
  ScrollController scrollController = ScrollController();
  RxList<ImageModel> images = <ImageModel>[].obs;
  int page = 1;

  PixabayApi get _api => PixabayApi();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
  }

  @override
  void onClose() {
    searchController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadImages();
    }
  }

  Future<void> searchImages(String query) async {
    // Debounce search here
    ProgressDialogUtils.showProgressDialog();
    await loadImages();
    ProgressDialogUtils.hideProgressDialog();
  }

  Future<void> loadImages() async {
    String query = searchController.text;
    try {
      if (page <= 20) {
        var data = await _api.searchImages(query, page, 20);
        List<ImageModel> newImages = [];

        for (var item in data['hits']) {
          newImages.add(ImageModel(
            imageUrl: item['webformatURL'],
            likes: item['likes'],
            views: item['views'],
          ));
        }

        images.addAll(newImages);
        page++;
        update();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error loading images: $e');
      }
    }
  }

  void onImageTap(BuildContext context, int index) {
    ProgressDialogUtils.showProgressDialog();
    Get.dialog(
      ImageViewDialog(images: images, initialIndex: index),
      barrierDismissible: false,
    ).then((value) {
      if (value != null && value is int) {
        // Navigated to a different image
        onImageTap(context, value);
      }
    });
  }
}
