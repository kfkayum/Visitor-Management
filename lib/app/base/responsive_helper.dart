import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';

class ResponsiveHelper {
  static bool isMobilePhone() {
    if (!kIsWeb) {
      return true;
    } else {
      return false;
    }
  }

  static bool isWeb() {
    return kIsWeb;
  }

  static bool isMobile() {
    if (Get.width < 650 || !kIsWeb) {
      return true;
    } else {
      return false;
    }
  }

  static bool isTab() {
    if (Get.width < 1150 && Get.width >= 650) {
      return true;
    } else {
      return false;
    }
  }

  static bool isDesktop() {
    if (Get.width >= 1150) {
      return true;
    } else {
      return false;
    }
  }
}
