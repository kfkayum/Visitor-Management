import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../util/app_colors.dart';
import '../../../util/app_constants.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../../../util/styles.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (splashController) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // app logo here--->
                Image.asset(
                  Images.APP_LOGO,
                  fit: BoxFit.fill,
                  height: 100.h,
                ),
                SizedBox(height: 10.h),
                // app name here--->
                Text(
                  AppConstants.appName,
                  style: robotoBlack.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: Dimensions.fontSizeOverLarge.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
