import 'package:fluttertoast/fluttertoast.dart';
import '../../constant/app_imports.dart';

class CustomSnackbar {

  static void showSnackbar(String title, String message, Color bgColor) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: bgColor,
      colorText: Colors.white,
      margin: const EdgeInsets.all(10),
    );
  }

  //----------TOAST------------//
  static Future<bool?> showToast(BuildContext context, String msg,
      {ToastGravity gravity = ToastGravity.BOTTOM}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: AppColors.success,
      textColor: AppColors.white,
      fontSize: 15,
    );
  }

  static Future<bool?> showErrorToast(BuildContext context, String msg,
      {ToastGravity gravity = ToastGravity.BOTTOM}) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      backgroundColor: AppColors.error,
      textColor: AppColors.white,
      fontSize: 15,
    );
  }
}