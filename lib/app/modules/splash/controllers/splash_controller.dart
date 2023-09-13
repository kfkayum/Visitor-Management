// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../auth/login/controllers/login_controller.dart';

class SplashController extends GetxController {
  final LoginController loginController = Get.put(LoginController());
  @override
  void onInit() {
    routeNewPage();
    super.onInit();
  }

// Route another page function
  void routeNewPage() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // Get.offAll(() => ProfileScreen());
        Get.offAllNamed(Routes.ONBORDING);
      },
    );
  }
}
