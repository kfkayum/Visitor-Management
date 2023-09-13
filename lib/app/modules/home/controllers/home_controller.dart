import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../base/custom_snackbar.dart';
import '../../../util/app_colors.dart';

class HomeController extends GetxController {
// create a global form for Access info form ===>
  GlobalKey<FormState> accessformKey = GlobalKey<FormState>();

  late TextEditingController purposeOfVisiteController, belongsController;

  var purposeOfVisite = '';
  var belongs = '';
  RxBool refreshForm = false.obs;
  RxBool isLoading = false.obs;
  RxString selectedDate = "".obs;
  RxString selectedTime = "".obs;

  // Initial Form Controller ===>
  @override
  void onInit() {
    super.onInit();
    purposeOfVisiteController = TextEditingController();
    belongsController = TextEditingController();
  }

// Dispose form controllers====>
  @override
  void dispose() {
    purposeOfVisiteController.dispose();
    belongsController.dispose();
    super.dispose();
  }

// Name Validation function ===>
  String? validatePurposeOfVisite(String value) {
    if (value.isEmpty) {
      return "Perpose of visite can't be empty";
    }
    return null;
  }

  // Name Validation function ===>
  String? validatebelongs(String value) {
    if (value.isEmpty) {
      return "Belongs can't be empty";
    }
    return null;
  }

  void onDateSelected(DateTime date) {
    selectedDate.value = DateFormat("yyyy-MM-dd").format(date);
  }

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      onDateSelected(picked);
    }
  }

  void setSelectedTime(TimeOfDay time) {
    selectedTime.value =
        '${time.hour}:${time.minute.toString().padLeft(2, '0')}';
  }

  Future selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setSelectedTime(pickedTime);
    }
  }

// Registartion submit form call by this function ====>
  void submitForm() async {
    final isValid = accessformKey.currentState!.validate();
    if (isValid) {
      accessformKey.currentState!.save();

      if (kDebugMode) {
        print("purposeOfVisite===>  $purposeOfVisite");
        print("belongs===>  $belongs");
        print("selectedDate===>  $selectedDate");
        print("selectedTime===>  $selectedTime");
      }

      // refress form ====>
      if (refreshForm.isTrue) {
        accessformKey.currentState?.reset();
        refreshForm.value = false;
      }

      if (purposeOfVisite.isNotEmpty &&
          belongs.isNotEmpty &&
          selectedDate.isNotEmpty &&
          selectedTime.isNotEmpty) {
        Get.snackbar(
          "Your form has been submitted",
          "Please wait for approval.",
          icon: const Icon(
            Icons.beenhere_outlined,
            color: AppColors.whiteColor,
          ),
          colorText: AppColors.whiteColor,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          backgroundColor: AppColors.primaryColor,
        );

        purposeOfVisite = "";
        belongs = "";
        selectedDate.value = "";
        selectedTime.value = "";
        update();
      } else if (selectedDate.isEmpty || selectedTime.isEmpty) {
        CustomSnackBar.show("Somthing Wrong!!", "Date or Time can't be empty");
      }
    }
  }
}
