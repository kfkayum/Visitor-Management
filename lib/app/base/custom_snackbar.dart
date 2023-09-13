import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../util/app_colors.dart';

class CustomSnackBar {
  static void show(
    String title,
    String message, {
    Duration duration = const Duration(seconds: 2),
  }) {
    Get.snackbar(
      title,
      message,
      icon: const Icon(
        Icons.dangerous_outlined,
        color: AppColors.whiteColor,
      ),
      colorText: AppColors.whiteColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: duration,
      backgroundColor: AppColors.primaryColor,
    );
  }
}
