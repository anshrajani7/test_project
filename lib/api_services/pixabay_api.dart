import 'package:dio/dio.dart';
import '../core/app_export.dart';

class PixabayApi {

  final Dio dio=Dio();

  Future<dynamic> searchImages(String query, int page, int perPage) async {
    try {

        final queryParams = {
          "key": "43751003-cf78877bd0f7f0d23977ed39d",
          "q": query,
          "page": page.toString(),
          "per_page": perPage.toString(),
        };

        final url = Uri.https("pixabay.com", "/api/", queryParams).toString();
        if (kDebugMode) {
          print("Request URL: $url");
        }

        final response = await dio.get(url);
        final responseData = response.data;
        return responseData;

    } catch (e) {
      if (kDebugMode) {
        print("Error loading images: $e");
      }
      rethrow; // Re-throw the error to propagate it to the caller
    }
  }

}