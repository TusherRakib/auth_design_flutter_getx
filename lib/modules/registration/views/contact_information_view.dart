import 'package:auth_design_flutter_getx/modules/registration/views/parent_info_view.dart';
import 'package:auth_design_flutter_getx/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_constraints.dart';
import '../controllers/registration_controller.dart';

class ContactInformationView extends GetView<RegistrationController> {
  const ContactInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: const Color(0xff22668D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Contact Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            AppConstrains.height10,
            TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: controller.emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_rounded),
                hintText: 'Email Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            AppConstrains.height10,
            TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: controller.phoneNumberController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            AppConstrains.height10,
            SizedBox(
              height: 100,
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: controller.streetController,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    width: 50,
                    padding: const EdgeInsets.only(top: 17, left: 13),
                    alignment: Alignment.topLeft,
                    child: const Icon(Icons.location_on),
                  ),
                  hintText: 'Address',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                maxLines: 20,
              ),
            ),
            AppConstrains.height10,
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  height: 53,
                  onTap: () {
                    Get.to(const ParentInformationView());
                  },
                  child: const Text("Next"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
