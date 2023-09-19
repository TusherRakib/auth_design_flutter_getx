import 'dart:developer';

import 'package:auth_design_flutter_getx/app_routes/routes_path.dart';
import 'package:auth_design_flutter_getx/modules/registration/views/academic_info_view.dart';
import 'package:auth_design_flutter_getx/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_constraints.dart';
import '../controllers/registration_controller.dart';

class UserformationView extends GetView<RegistrationController> {
  const UserformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: const Color(0xff22668D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Username and Password',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  AppConstrains.height10,
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: controller.usernameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  AppConstrains.height10,
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  AppConstrains.height10,
                  TextFormField(
                    style: const TextStyle(color: Colors.black),
                    controller: controller.confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  AppConstrains.height20,
                  const Text(
                    'Consent and Agreements',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  AppConstrains.height10,
                  Obx(
                    () => CheckboxListTile(
                      value: controller.acceptedTerms.value,
                      onChanged: (value) {
                        controller.acceptedTerms.value = value!;
                      },
                      title: const Text('I accept the Terms and Conditions'),
                    ),
                  ),
                  AppConstrains.height10,
                  Obx(
                    () => CheckboxListTile(
                      value: controller.agreedToPrivacyPolicy.value,
                      onChanged: (value) {
                        controller.agreedToPrivacyPolicy.value = value!;
                      },
                      title: const Text('I agree to the Privacy Policy'),
                    ),
                  ),
                  AppConstrains.height100,
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: AppButton(
                height: 53,
                onTap: () {
                  if (controller.usernameController.text == "") {
                    Get.snackbar("Alert!", "Please enter a username",
                        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                  } else if (controller.passwordController.text == "") {
                    Get.snackbar("Alert!", "Please Enter password",
                        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                  } else if (controller.confirmPasswordController.text == "" ||
                      controller.confirmPasswordController.text != controller.passwordController.text) {
                    Get.snackbar("Alert!", "Passwords don't Match",
                        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                  } else if (!controller.acceptedTerms.value) {
                    log(controller.acceptedTerms.value.toString());
                    Get.snackbar("Alert!", "Please accept the terms & conditions",
                        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                  } else if (!controller.agreedToPrivacyPolicy.value) {
                    log(controller.agreedToPrivacyPolicy.value.toString());
                    Get.snackbar("Alert!", "Please accept the privacy policy",
                        snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                  } else {
                    Get.toNamed(RoutesPath.homePage);
                  }
                },
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
