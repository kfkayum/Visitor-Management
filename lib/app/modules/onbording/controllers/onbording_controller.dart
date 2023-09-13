import 'package:get/get.dart';

import '../../../util/images.dart';

class OnbordingController extends GetxController {
  // for changeing screen==>
  RxInt currentIndex = 0.obs;

  // Image list for onbording screen ===>
  List imageFile = [
    Images.LOTTIE1,
    Images.LOTTIE2,
    Images.LOTTIE3,
    Images.LOTTIE4,
  ];

  // Onbording title here ===>
  List<String> title = [
    'Welcome to Visitor Management App',
    'Visitor Check-In Made Easy',
    "Reports and Analytics",
    'Visitor Access Control',
  ];

  // onbording discription==>
  List<String> description = [
    "A step-by-step introduction to our visitor management app, showing you the ropes and helping you get started with ease.",
    "Streamline the visitor onboarding process with our user-friendly app. Simplify check-ins, enhance security, and create a welcoming experience for guests.",
    "Our app ensure regulatory compliance with comprehensive reporting and audit trail capabilities.",
    "Take control of who enters your premises effortlessly. Our app empowers you to manage visitor access permissions seamlessly, ensuring the safety of your space.",
  ];
}
