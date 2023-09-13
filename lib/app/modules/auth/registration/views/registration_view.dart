import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../base/custom_button.dart';
import '../../../../base/my_text_field.dart';
import '../../../../routes/app_pages.dart';
import '../../../../util/app_colors.dart';
import '../../../../util/dimensions.dart';
import '../../../../util/images.dart';
import '../../../../util/styles.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  RegistrationView({Key? key}) : super(key: key);

  final RegistrationController registrationController =
      Get.put(RegistrationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
              image: const AssetImage(
                Images.LOGIN_BG_IMAGE,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT,
                    vertical: Dimensions.PADDING_SIZE_DEFAULT),
                child: Column(
                  children: [
                    // Create account header section ====>
                    Column(
                      children: [
                        Text(
                          "Hello Again!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 35.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Create a new account',
                          textAlign: TextAlign.center,
                          style: robotoMedium.copyWith(
                            color: AppColors.deepGreyColor,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30.h),

                    // Text form field start here ===>
                    Form(
                      key: registrationController.registrationformKey,
                      child: Column(
                        children: [
                          // Name Text field ===>
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Name',
                              prefixIcon: const Icon(
                                Icons.person_outline,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            controller: registrationController.nameController,
                            onSaved: (value) {
                              registrationController.name = value!;
                            },
                            validator: (value) {
                              return registrationController
                                  .validateName(value!);
                            },
                          ),
                          SizedBox(height: 10.h),

                          // Organization Name Text field ===>
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Organization Name',
                              prefixIcon: const Icon(
                                Icons.business_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            controller: registrationController
                                .organizationNameController,
                            onSaved: (value) {
                              registrationController.organizationName = value!;
                            },
                            validator: (value) {
                              return registrationController
                                  .validateOrganizationName(value!);
                            },
                          ),
                          SizedBox(height: 10.h),

                          // Designation Text field ===>
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Designation',
                              prefixIcon: const Icon(
                                Icons.chair_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            controller:
                                registrationController.designationController,
                            onSaved: (value) {
                              registrationController.designation = value!;
                            },
                            validator: (value) {
                              return registrationController
                                  .validateDesignation(value!);
                            },
                          ),
                          SizedBox(height: 10.h),

                          // Email Text field ===>
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Email',
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            controller: registrationController.emailController,
                            onSaved: (value) {
                              registrationController.email = value!;
                            },
                            validator: (value) {
                              return registrationController
                                  .validateEmail(value!);
                            },
                          ),
                          SizedBox(height: 10.h),

                          // Mobile Number Text field ===>
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Mobile Number',
                              prefixIcon: const Icon(
                                Icons.phone_android_outlined,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            controller:
                                registrationController.phoneNumberController,
                            onSaved: (value) {
                              registrationController.phoneNumber = value!;
                            },
                            validator: (value) {
                              return registrationController
                                  .validatephoneNumver(value!);
                            },
                          ),
                          SizedBox(height: 10.h),

                          // Dropdown Item===>
                          Container(
                            padding: const EdgeInsets.only(
                                right: Dimensions.PADDING_SIZE_SMALL),
                            height: 50.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.4)),
                              borderRadius: BorderRadius.circular(
                                Dimensions.RADIUS_SMALL,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: DropdownButtonFormField(
                                icon: const Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: AppColors.primaryColor),
                                value:
                                    registrationController.selectedOption.value,
                                menuMaxHeight: 220.h,

                                // dropdownColor:
                                //     AppColors.whiteColor.withOpacity(0.1),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.device_hub_outlined,
                                    color: AppColors.primaryColor,
                                  ),
                                  // suffixIcon: Icon(
                                  //   Icons.arrow_drop_down_circle_outlined,
                                  //   color: AppColors.primaryColor,
                                  // ),
                                ),
                                onChanged: (newValue) {
                                  registrationController.selectedOption.value =
                                      newValue!;
                                },
                                items: <String>[
                                  'Select Access Type',
                                  'Security Admin',
                                  'Vendor',
                                  'Customer',
                                  'Visitors',
                                ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      alignment: Alignment.centerLeft,
                                      value: value,
                                      child: Text(
                                        value,
                                        style: robotoMedium.copyWith(
                                          color: AppColors.deepGreyColor,
                                          fontSize: Dimensions.fontSizeDefault,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.h),

                          // Password Text field ===>
                          Obx(
                            () => TextFormField(
                              obscureText: registrationController
                                  .passwordObscureText.value,
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Password',
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: AppColors.primaryColor,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    registrationController
                                            .passwordObscureText.value
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 18,
                                    color: AppColors.deepGreyColor,
                                  ),
                                  onPressed: () {
                                    registrationController
                                            .passwordObscureText.value =
                                        !registrationController
                                            .passwordObscureText.value;
                                    if (kDebugMode) {
                                      print(registrationController
                                          .passwordObscureText);
                                    }
                                  },
                                ),
                              ),
                              controller:
                                  registrationController.passwordController,
                              onSaved: (value) {
                                registrationController.password = value!;
                              },
                              validator: (value) {
                                return registrationController
                                    .validatePassword(value!);
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),

                          // Confirm  Password Text field ===>
                          Obx(
                            () => TextFormField(
                              obscureText: registrationController
                                  .confirmPassObscureText.value,
                              decoration: textInputDecoration.copyWith(
                                labelText: 'Confirm Password',
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: AppColors.primaryColor,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    registrationController
                                            .confirmPassObscureText.value
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 18,
                                    color: AppColors.deepGreyColor,
                                  ),
                                  onPressed: () {
                                    registrationController
                                            .confirmPassObscureText.value =
                                        !registrationController
                                            .confirmPassObscureText.value;
                                    if (kDebugMode) {
                                      print(registrationController
                                          .confirmPassObscureText);
                                    }
                                  },
                                ),
                              ),
                              controller: registrationController
                                  .confirmPasswordController,
                              onSaved: (value) {
                                registrationController.confirmPassword = value!;
                              },
                              validator: (value) {
                                return registrationController
                                    .validateConfirmPassword(value!);
                              },
                            ),
                          ),
                          SizedBox(height: 30.h),

                          // Submit Button ===>
                          registrationController.isLoading.value == true
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : CustomButton(
                                  buttonWidth: double.infinity,
                                  buttonName: 'Create Account',
                                  fontSize: Dimensions.fontSizeLarge.sp,
                                  onPressed: () {
                                    registrationController.submitForm();
                                    registrationController.refreshForm.toggle();
                                  },
                                ),
                          SizedBox(height: 10.h),

                          // Login page routiong section ====>
                          Text.rich(
                            TextSpan(
                              text: "Already have an account?  ",
                              style: robotoMedium.copyWith(
                                color: AppColors.blackColor,
                              ),
                              children: [
                                TextSpan(
                                  text: "Login Now",
                                  style: robotoMedium.copyWith(
                                    color: AppColors.primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.offAllNamed(Routes.LOGIN);
                                    },
                                ),
                              ],
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
        ),
      ),
    );
  }
}
