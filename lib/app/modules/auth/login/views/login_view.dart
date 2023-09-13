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
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final LoginController loginController = Get.put(LoginController());
  final RxBool passwordObscureText = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // welcome section===>
                  Column(
                    children: [
                      // welcome text
                      Text(
                        "Welcome Again!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 5.h),

                      // Sig In now to see your best homes! text
                      Text(
                        'Sign in to see how we manage!!',
                        textAlign: TextAlign.center,
                        style: robotoMedium.copyWith(
                          color: AppColors.deepGreyColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),

                  // Form section ===>
                  Form(
                    key: loginController.loginFormKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Email text field
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                            labelText: 'Email',
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          controller: loginController.emailController,
                          onSaved: (value) {
                            loginController.email = value!;
                          },
                          validator: (value) {
                            return loginController.validateEmail(value!);
                          },
                        ),
                        SizedBox(height: 10.h),

                        // password text field
                        Obx(
                          () => TextFormField(
                            obscureText: passwordObscureText.value,
                            decoration: textInputDecoration.copyWith(
                              labelText: 'Password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: AppColors.primaryColor,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  passwordObscureText.value
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  size: 18,
                                  color: AppColors.deepGreyColor,
                                ),
                                onPressed: () {
                                  passwordObscureText.value =
                                      !passwordObscureText.value;
                                  if (kDebugMode) {
                                    print(passwordObscureText);
                                  }
                                },
                              ),
                            ),
                            controller: loginController.passwordController,
                            onSaved: (value) {
                              loginController.password = value!;
                            },
                            validator: (value) {
                              return loginController.validatePassword(value!);
                            },
                          ),
                        ),
                        SizedBox(height: 30.h),

                        // submit button
                        loginController.isLoading.value == true
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : CustomButton(
                                buttonWidth: double.infinity,
                                buttonName: 'Sign In',
                                fontSize: Dimensions.fontSizeLarge.sp,
                                onPressed: () {
                                  loginController.submitForm();
                                  loginController.refreshForm.toggle();
                                },
                              ),
                        SizedBox(height: 10.h),

                        // Don't have an account?  section

                        Text.rich(
                          TextSpan(
                            text: "Don't have an account?  ",
                            style: robotoMedium.copyWith(
                              color: AppColors.blackColor,
                            ),
                            children: [
                              TextSpan(
                                text: "Register here",
                                style: robotoMedium.copyWith(
                                    color: AppColors.primaryColor,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.offAllNamed(Routes.REGISTRATION);
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
    );
  }
}
