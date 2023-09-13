// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../routes/app_pages.dart';
import '../../../../util/app_colors.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController;
  var email = '';
  var password = '';
  String access_token = 'null';
  RxBool refreshForm = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadToken();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Please enter your valid email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // token store  function ===>
  void loadToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    access_token = prefs.getString('access_token') ?? "null";

    if (kDebugMode) {
      // print("LoadToken ===> $access_token");
    }
  }

  void submitForm() async {
    final isValid = loginFormKey.currentState!.validate();
    // Get.focusScope!.unfocus();
    if (isValid) {
      loginFormKey.currentState!.save();
      // print value
      if (kDebugMode) {
        print("Email===>  $email");
        print("Password===> $password");
      }

      Get.snackbar(
        "Congratulations!!",
        "Sign In Successfully Done",
        icon: const Icon(
          Icons.beenhere_outlined,
          color: AppColors.whiteColor,
        ),
        colorText: AppColors.whiteColor,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
        backgroundColor: AppColors.primaryColor,
      );
      Get.offAllNamed(Routes.HOME);

      // refress form ====>
      if (refreshForm.isTrue) {
        loginFormKey.currentState?.reset();
        refreshForm.value = false;
      }
    }

    // try {
    //   isLoading(true);
    //   update();

    //   final response = await post(
    //     Uri.parse("${AppConstants.BASE_URL}/api/login"),
    //     body: {'email': email, 'password': password},
    //   );

    //   var data = jsonDecode(response.body);

    //   if (response.statusCode == 200) {
    //     await prefs.setString('access_token', data["access_token"]);
    //     access_token = data["access_token"];
    //     if (kDebugMode) {
    //       //  print("token======>  $access_token");
    //     }

    //     Get.snackbar(
    //       "Congratulations!",
    //       'Sign In Successfully',
    //       icon: const Icon(
    //         Icons.beenhere_outlined,
    //         color: AppColors.whiteColor,
    //       ),
    //       colorText: AppColors.whiteColor,
    //       snackPosition: SnackPosition.BOTTOM,
    //       duration: const Duration(seconds: 3),
    //       backgroundColor: AppColors.primaryColor.withOpacity(0.8),
    //     );
    //     if (refreshForm.isTrue) {
    //       loginFormKey.currentState?.reset();
    //       refreshForm.value = false;
    //     }
    //   }
    // } catch (e) {
    //   Get.snackbar("Error", "Something Wrong, Try again");
    //   rethrow;
    // } finally {
    //   isLoading(false);
    //   update();
    // }
  }
}
