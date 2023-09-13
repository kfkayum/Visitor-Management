import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/util/app_colors.dart';
import 'app/util/app_constants.dart';

void main() {
  runApp(
    // Use ScreenUtilInit package for responsive our  app
    ScreenUtilInit(
      designSize: const Size(360, 690), // initial device size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        // Use GetMaterialApp for using Getx package
        return GetMaterialApp(
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,

          // Theme section ===>
          theme: ThemeData(
            primarySwatch: AppColors.primarySwatchValueColor,
            scaffoldBackgroundColor: AppColors.scaffoldColor,
          ),

          // Init Route section ===>
          initialRoute: AppPages.INITIAL,

          // Get all Pages form there ===>
          getPages: AppPages.routes,

          // Page to page transition time ===>
          transitionDuration: const Duration(milliseconds: 500),
        );
      },
    ),
  );
}
