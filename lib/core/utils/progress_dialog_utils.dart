import 'package:test_project/core/app_export.dart';

class ProgressDialogUtils {
  static bool isProgressVisible = false;

  ///common method for showing progress dialog
  static void showProgressDialog({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(
            strokeWidth: 4,
            valueColor: AlwaysStoppedAnimation<Color>(
              ColorConstant.redFF2,
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  static void showProgressDialogSmall({isCancellable = false}) async {
    if (!isProgressVisible) {
      Get.dialog(
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator.adaptive(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorConstant.redFF2,
                ),
              ),
            ),
          ),
        ),
        barrierDismissible: isCancellable,
      );
      isProgressVisible = true;
    }
  }

  ///common method for hiding progress dialog
  static void hideProgressDialog() {
    if (isProgressVisible) Get.back();
    isProgressVisible = false;
  }

  static void showSnackBar({headerText, bodyText}) {
    Get.closeAllSnackbars();
    Get.snackbar(headerText, bodyText,
        snackPosition: SnackPosition.BOTTOM,
        colorText: ColorConstant.primaryBlack,
        backgroundColor: ColorConstant.primaryBlue,
        margin: const EdgeInsets.only(bottom: 26, left: 16, right: 16));
  }
}