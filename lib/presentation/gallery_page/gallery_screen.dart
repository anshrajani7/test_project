import 'package:test_project/widgets/text_form_filed.dart';

import '../../core/app_export.dart';
import 'controller/gallery_page_controller.dart';

class GalleryScreen extends GetWidget<GalleryScreenController> {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        appBar: AppBar(
          title: SearchTextField(
            controller: controller.searchController,
            search: controller.searchImages,
            hintText: AppString.searchForImage,
          ),
        ),
        body: Obx(
          () => controller.images.isNotEmpty
              ? GridView.builder(
                  controller: controller.scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        constraints.minWidth ~/ 300, // Adjust as needed
                    mainAxisExtent: constraints.maxHeight / 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: controller.images.length,
                  itemBuilder: (context, index) {
                    return Bounce(
                      onTap: () => controller.onImageTap(context, index),
                      child: Hero(
                          tag: controller.images[index].imageUrl,
                          child: CustomImageView(
                            height: constraints.maxHeight / 3,
                            width: constraints.maxHeight / 3,
                            url: controller.images[index].imageUrl,
                            fit: BoxFit.cover,
                          )),
                    );
                  },
                )
              : const Center(
                  child: Text(AppString.pleaseSpecifyImage,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                ),
        ),
      ),
    );
  }
}
