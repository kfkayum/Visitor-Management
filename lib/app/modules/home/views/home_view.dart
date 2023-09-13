import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:visitor_management/app/base/custom_button.dart';
import 'package:visitor_management/app/util/styles.dart';

import '../../../base/custom_drower.dart';
import '../../../base/my_text_field.dart';
import '../../../util/app_colors.dart';
import '../../../util/dimensions.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Access Information',
          style: robotoMedium.copyWith(),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_DEFAULT,
              vertical: Dimensions.PADDING_SIZE_SMALL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: homeController.accessformKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Purpose Of Visite Text field ===>

                    Text(
                      "Purpose Of Visite: ",
                      style: robotoMedium.copyWith(
                        color: AppColors.deepGreyColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        filled: true,
                        fillColor: AppColors.navBGColor.withOpacity(.2),
                      ),
                      maxLines: 3,
                      controller: homeController.purposeOfVisiteController,
                      onSaved: (value) {
                        homeController.purposeOfVisite = value!;
                      },
                      validator: (value) {
                        return homeController.validatePurposeOfVisite(value!);
                      },
                    ),
                    SizedBox(height: 12.h),

                    // Belongs Text field ===>
                    Text(
                      "Belongs: ",
                      style: robotoMedium.copyWith(
                        color: AppColors.deepGreyColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        filled: true,
                        fillColor: AppColors.navBGColor.withOpacity(.2),
                      ),
                      controller: homeController.belongsController,
                      onSaved: (value) {
                        homeController.belongs = value!;
                      },
                      validator: (value) {
                        return homeController.validatebelongs(value!);
                      },
                    ),
                    SizedBox(height: 12.h),

                    // date picker section
                    Text(
                      "Date:",
                      style: robotoMedium.copyWith(
                        color: AppColors.deepGreyColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    InkWell(
                      onTap: () {
                        homeController.selectDate(context);
                      },
                      child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: AppColors.navBGColor.withOpacity(.2),
                            borderRadius: BorderRadius.circular(
                              Dimensions.RADIUS_SMALL,
                            ),
                            border: Border.all(
                              color: AppColors.primaryColor.withOpacity(0.4),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.PADDING_SIZE_SMALL),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(() => Text(
                                    homeController.selectedDate.value
                                        .toString()
                                        .split(' ')[0],
                                    style: robotoMedium)),
                                const Icon(
                                  Icons.edit_calendar_outlined,
                                  color: AppColors.primaryColor,
                                  size: 22,
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(height: 12.h),

                    // Time picker section
                    Text(
                      "Time:",
                      style: robotoMedium.copyWith(
                        color: AppColors.deepGreyColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    InkWell(
                      onTap: () {
                        homeController.selectTime(context);
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.navBGColor.withOpacity(.2),
                          borderRadius: BorderRadius.circular(
                            Dimensions.RADIUS_SMALL,
                          ),
                          border: Border.all(
                            color: AppColors.primaryColor.withOpacity(0.4),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: Dimensions.PADDING_SIZE_SMALL),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => Text(homeController.selectedTime.value,
                                  style: robotoMedium)),
                              const Icon(
                                Icons.access_alarms_outlined,
                                color: AppColors.primaryColor,
                                size: 22,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: CustomButton(
                        buttonWidth: Get.width / 1.2,
                        buttonName: "Apply For Entry",
                        fontSize: Dimensions.fontSizeLarge,
                        onPressed: () {
                          homeController.submitForm();
                          homeController.refreshForm.toggle();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
