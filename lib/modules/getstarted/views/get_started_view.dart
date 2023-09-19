import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../app_routes/routes_path.dart';
import '../../../utils/app_constraints.dart';
import '../../../widgets/app_button.dart';
import '../controllers/get_started_controller.dart';

class GetStartedView extends GetView<GetStartedController> {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/json/grad_lottie.json", height: Get.height / 2.5),
            AppConstrains.height40,
            AppButton(
              buttonColor: const Color(0xff22668D),
              margin: const EdgeInsets.symmetric(horizontal: 100.0),
              radius: 5,
              elevation: 0.0,
              child: Text(
                "Sign Up",
                style: Get.textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
              ),
              onTap: () {
                Get.offAllNamed(RoutesPath.registrationView);
              },
            ),
            AppConstrains.height20,
            AppButton(
              buttonColor: const Color(0xff22668D),
              margin: const EdgeInsets.symmetric(horizontal: 100.0),
              radius: 5,
              elevation: 0.0,
              child: Text(
                "Login",
                style: Get.textTheme.headlineSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.w800),
              ),
              onTap: () {
                Get.offAllNamed(RoutesPath.logInView);
              },
            ),
          ],
        ),
      ),
    );
  }
}
