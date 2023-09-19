import 'package:auth_design_flutter_getx/modules/registration/views/academic_info_view.dart';
import 'package:auth_design_flutter_getx/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_constraints.dart';
import '../controllers/registration_controller.dart';

class ParentInformationView extends GetView<RegistrationController> {
  const ParentInformationView({super.key});

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
                      'Parent/Guardian Information',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.parentGuardianNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Parent/Guardian Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.parentGuardianEmailController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email_rounded),
                        hintText: 'Parent/Guardian Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.parentGuardianPhoneController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Parent/Guardian Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    AppConstrains.height20,
                    const Text(
                      'Emergency Contact',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.emergencyContactNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Emergency Contact Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.emergencyContactPhoneController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Emergency Contact Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.relationshipToStudentController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'Relationship to Student',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
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
                    if (controller.parentGuardianNameController.text == "") {
                      Get.snackbar("Alert!", "Guardian Name can not be empty",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (!controller.parentGuardianEmailController.text.contains("@")) {
                      Get.snackbar("Alert!", "Please enter a valid Guardian Email",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.parentGuardianPhoneController.text == "") {
                      Get.snackbar("Alert!", "Guardian phone number can not be empty",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.emergencyContactNameController.text == "") {
                      Get.snackbar("Alert!", "Emergency Name can not be empty",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.emergencyContactPhoneController.text == "") {
                      Get.snackbar("Alert!", "Emergency Phone a Valid Email",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.relationshipToStudentController.text == "") {
                      Get.snackbar("Alert!", "Relationship details can not be empty",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else {
                      Get.to(const AcademicInformationView());
                    }
                  },
                  child: const Text("Next"),
                ),
              ),
            ],
          )),
    );
  }
}
