import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:visitor_management/app/util/dimensions.dart';
import '../../../base/custom_button.dart';
import '../../../routes/app_pages.dart';
import '../../../util/app_colors.dart';
import '../../../util/styles.dart';
import '../controllers/onbording_controller.dart';

class OnbordingView extends GetView<OnbordingController> {
  OnbordingView({Key? key}) : super(key: key);

  final OnbordingController onbordingController =
      Get.put(OnbordingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                  child: Column(
                    children: [
                      // Onbording Image section here===>
                      Expanded(
                        flex: 2,
                        child: Obx(
                          () => Align(
                              alignment: Alignment.center,
                              child: Lottie.asset(
                                onbordingController.imageFile[
                                    onbordingController.currentIndex.toInt()],
                                height: 280.h,
                                fit: BoxFit.fill,
                              )

                           ,
                              ),
                        ),
                      ),

                      // Onbording Title, Discription, Dot Indicator,Next Button and Skip Button==>
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Title here===>
                            Obx(
                              () => Text(
                                onbordingController.title[
                                    onbordingController.currentIndex.toInt()],
                                textAlign: TextAlign.center,
                                style: robotoMedium.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: Dimensions.fontSizeOverLarge.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),

                            // Discription Here==>
                            Obx(
                              () => Text(
                                onbordingController.description[
                                    onbordingController.currentIndex.toInt()],
                                textAlign: TextAlign.center,
                                style: robotoMedium.copyWith(
                                  color: AppColors.lightGreyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Next Button, Skip BUtton, Get Start Button
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Dot Indicator here===>
                            Obx(
                              () => DotsIndicator(
                                dotsCount: onbordingController.imageFile.length,
                                position:
                                    onbordingController.currentIndex.value,
                                decorator: DotsDecorator(
                                  activeColor: AppColors.primaryColor,
                                  size: const Size.square(10.0),
                                  activeSize: const Size(20.0, 10.0),
                                  activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                              ),
                            ),

                            // Next and Skip Button ===>
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: Dimensions.PADDING_SIZE_DEFAULT),
                              child: Obx(
                                () => onbordingController.currentIndex.value ==
                                        3
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: Dimensions
                                                .PADDING_SIZE_DEFAULT),
                                        child: CustomButton(
                                          buttonName: "Get started",
                                          buttonWidth: double.infinity,
                                          fontSize: Dimensions.fontSizeLarge.sp,
                                          onPressed: () {
                                            Get.offNamed(Routes.LOGIN);
                                          },
                                        ),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          // Skip Button here===>
                                          InkWell(
                                            onTap: () {
                                              Get.offNamed(Routes.LOGIN);
                                            },
                                            child: SizedBox(
                                              height: 30.h,
                                              width: 60.w,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  "SKIP",
                                                  style: robotoMedium.copyWith(
                                                    color:
                                                        AppColors.deepGreyColor,
                                                    fontSize: Dimensions
                                                        .fontSizeDefault.sp,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          // Next and Done Button here===>
                                          CustomButton(
                                            buttonWidth: 110.w,
                                            buttonName: "NEXT",
                                            fontSize:
                                                Dimensions.fontSizeDefault.sp,
                                            onPressed: () {
                                              if (onbordingController
                                                      .currentIndex.value ==
                                                  3) {
                                                Get.offNamed(Routes.LOGIN);
                                              } else {
                                                onbordingController
                                                        .currentIndex +
                                                    1;
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
