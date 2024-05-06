import 'package:test_project/core/app_export.dart';
import 'package:test_project/models/image_model.dart';

class ImageController extends GetxController {
  RxInt currentIndex = 0.obs;

  void decrementIndex() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  void incrementIndex(int maxIndex) {
    if (currentIndex.value < maxIndex) {
      currentIndex.value++;
    }
  }
}

class ImageViewDialog extends StatelessWidget {
  final List<ImageModel> images;
  final int initialIndex;

  const ImageViewDialog(
      {super.key, required this.images, required this.initialIndex});

  @override
  Widget build(BuildContext context) {
    final ImageController imageController = Get.put(ImageController());
    imageController.currentIndex.value = initialIndex;
    return GestureDetector(
      onTap: () {
        ProgressDialogUtils.hideProgressDialog();
        Get.back();
      },
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Bounce(
              onTap: () => imageController.decrementIndex(),
              child: Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(Icons.arrow_back),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Obx(() => CustomImageView(
                  url: images[imageController.currentIndex.value].imageUrl,
                  fit: BoxFit.contain,
                  height: MediaQuery.of(context).size.height / 1,
                  width: MediaQuery.of(context).size.width / 2,
                )),
            const SizedBox(
              width: 10,
            ),
            Bounce(
              onTap: () => imageController.incrementIndex(images.length - 1),
              child: Container(
                height: 45,
                width: 45,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
