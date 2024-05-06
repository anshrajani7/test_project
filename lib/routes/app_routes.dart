import 'package:test_project/presentation/gallery_page/binding/gallery_page_binding.dart';
import 'package:test_project/presentation/gallery_page/gallery_screen.dart';

import '../core/app_export.dart';

class AppRoutes{
  static const String galleryScreenRoute = '/gallery_screen';

  static List<GetPage> pages = [
    GetPage(
      name: galleryScreenRoute,
      binding: GalleryScreenBinding(),
      page: () => const GalleryScreen(),
    ),
  ];
}