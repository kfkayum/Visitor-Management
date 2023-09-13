import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../util/app_colors.dart';

class RegistrationController extends GetxController {
// create a global form for registration form ===>
  GlobalKey<FormState> registrationformKey = GlobalKey<FormState>();

// Texteditting controller create here======>
  late TextEditingController nameController,
      organizationNameController,
      designationController,
      emailController,
      phoneNumberController,
      passwordController,
      confirmPasswordController;

// Local variable ===>
  RxBool passwordObscureText = true.obs;
  RxBool confirmPassObscureText = true.obs;
  RxString selectedOption = 'Select Access Type'.obs;
  var name = '';
  var organizationName = '';
  var designation = '';
  var email = '';
  var phoneNumber = '';
  var password = '';
  var confirmPassword = '';
  RxBool refreshForm = false.obs;
  RxBool isLoading = false.obs;

// Initial Form Controller ===>
  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    organizationNameController = TextEditingController();
    designationController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

// Dispose form controllers====>
  @override
  void dispose() {
    nameController.dispose();
    organizationNameController.dispose();
    designationController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

// Name Validation function ===>
  String? validateName(String value) {
    if (value.isEmpty) {
      return "Name can't be empty";
    }
    return null;
  }

  //Organization Name Validation function ===>
  String? validateOrganizationName(String value) {
    if (value.isEmpty) {
      return "Organization Name can't be empty";
    }
    return null;
  }

  //Organization Name Validation function ===>
  String? validateDesignation(String value) {
    if (value.isEmpty) {
      return "Designation can't be empty";
    }
    return null;
  }

// Phone  Validation function ===>
  String? validatephoneNumver(String value) {
    if (value.isEmpty) {
      return "Please type your Phone Number";
    }
    return null;
  }

// Email Validation function ===>
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Please enter your valid email';
    }
    return null;
  }

// Password Validation function ===>
  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

// Confirm Pass Validation function ===>
  String? validateConfirmPassword(String value) {
    if (value != passwordController.text) {
      return 'Password not same';
    }
    return null;
  }

// Registartion submit form call by this function ====>
  void submitForm() async {
    final isValid = registrationformKey.currentState!.validate();
    if (isValid) {
      registrationformKey.currentState!.save();

      if (kDebugMode) {
        print("Name===>  $name");
        print("organizationName===>  $organizationName");
        print("designation===>  $designation");
        print("Email===>  $email");
        print("phoneNumber===>  $phoneNumber");
        print("Password===> $password");
      }

      // refress form ====>
      if (refreshForm.isTrue) {
        registrationformKey.currentState?.reset();
        refreshForm.value = false;
      }

      if (selectedOption.value != 'Select Access Type') {
        Get.snackbar(
          "Congratulations!!",
          "Registraton Successfully Done",
          icon: const Icon(
            Icons.beenhere_outlined,
            color: AppColors.whiteColor,
          ),
          colorText: AppColors.whiteColor,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1),
          backgroundColor: AppColors.primaryColor,
        );
        Get.toNamed(Routes.LOGIN);
      } else {
        Get.snackbar(
          "Somthing Wrong!!",
          "Please Select Access Type",
          icon: const Icon(
            Icons.beenhere_outlined,
            color: AppColors.whiteColor,
          ),
          colorText: AppColors.whiteColor,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 1),
          backgroundColor: AppColors.primaryColor,
        );
      }

      // isLoading(true);
      // update();

      // api implementation
      // try {
      //   isLoading(true);

      //   // response create===>
      //   final response = await post(
      //     Uri.parse("${AppConstants.BASE_URL}/api/register"),
      //     body: {
      //       'name': name,
      //       'email': email,
      //       'phone': phoneNumber,
      //       'password': password,
      //       'password_confirmation': confirmPassword,
      //     },
      //   );

      //   // var data = jsonDecode(response.body);

      //   if (response.statusCode == 200) {
      //     // success message===>
      //     Get.snackbar(
      //       "Congratulations!",
      //       "SignUp Successfully",
      //       icon: const Icon(
      //         Icons.beenhere_outlined,
      //         color: AppColors.whiteColor,
      //       ),
      //       colorText: AppColors.whiteColor,
      //       snackPosition: SnackPosition.BOTTOM,
      //       duration: const Duration(seconds: 3),
      //       backgroundColor: AppColors.primaryColor,
      //     );

      //     Get.toNamed(Routes.LOGIN);
      //   } else if (response.statusCode != 200) {
      //     // Unsuccess message
      //     Get.snackbar(
      //       "Somthing Wrong!",
      //       "Phone number or email already taken.",
      //       icon: const Icon(
      //         Icons.error_outline_outlined,
      //         color: AppColors.whiteColor,
      //       ),
      //       colorText: AppColors.whiteColor,
      //       snackPosition: SnackPosition.BOTTOM,
      //       duration: const Duration(seconds: 3),
      //       backgroundColor: AppColors.primaryColor,
      //     );
      //   }
      // } catch (e) {
      //   // error show ===.
      //   Get.snackbar("Error", "Somthing Wrong, Try again");
      //   rethrow;
      // } finally {
      //   isLoading(false);
      //   update();
      // }
    }
  }
}
