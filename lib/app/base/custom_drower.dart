import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visitor_management/app/base/custom_snackbar.dart';
import '../routes/app_pages.dart';
import '../util/app_colors.dart';
import '../util/dimensions.dart';
import '../util/images.dart';
import '../util/styles.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.PADDING_SIZE_LARGE),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(Images.PROFILE_IMAGE),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        SizedBox(height: 5.h),
                        // Add your name here
                        Text(
                          "Abc",
                          style: robotoMedium.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Add your email here
                        Text(
                          "abc@gmail.com",
                          style: robotoMedium.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  horizontalTitleGap: 0,
                  leading: const Icon(
                    Icons.person_outline,
                    color: AppColors.primaryColor,
                  ),
                  title: Text('Profile', style: robotoMedium),
                  onTap: () {
                    // Navigate to the settings screen
                    //  Get.toNamed(Routes.PROFILE);

                    CustomSnackBar.show(
                        "Somthing Wrong!!", "It will be updated latter");
                  },
                ),
                // ListTile(
                //   horizontalTitleGap: 0,
                //   leading: const Icon(
                //     Icons.settings,
                //     color: AppColors.primaryColor,
                //   ),
                //   title: Text('Settings', style: robotoMedium),
                //   onTap: () {
                //     // Navigate to the settings screen
                //   },
                // ),
                ListTile(
                  horizontalTitleGap: 0,
                  leading: const Icon(
                    Icons.logout,
                    color: AppColors.primaryColor,
                  ),
                  title: Text('Logout', style: robotoMedium),
                  onTap: () async {
                    // // Perform logout operation
                    // final SharedPreferences prefs =
                    //     await SharedPreferences.getInstance();
                    // prefs.setString('access_token', "null");

                    Get.offAllNamed(Routes.ONBORDING);
                  },
                ),
              ],
            ),

            // Version number section===>
            Padding(
              padding:
                  const EdgeInsets.only(bottom: Dimensions.PADDING_SIZE_LARGE),
              child: Text(
                'Version: A-1.0.0',
                style: robotoMedium.copyWith(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
