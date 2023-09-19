import 'package:get/get.dart';

import '../../../app_routes/routes_path.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3)).then((value) => Get.offAllNamed(RoutesPath.getStartedView));
  }
}
