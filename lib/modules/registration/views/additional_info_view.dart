import 'package:auth_design_flutter_getx/modules/registration/views/academic_info_view.dart';
import 'package:auth_design_flutter_getx/modules/registration/views/username_pass_view.dart';
import 'package:auth_design_flutter_getx/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_constraints.dart';
import '../controllers/registration_controller.dart';

class AdditionalInformationView extends GetView<RegistrationController> {
  const AdditionalInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Additional Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            AppConstrains.height10,
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.card_membership),
                hintText: 'Citizenship Status',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              value: controller.selectedCitizenshipStatus,
              items: ['Bangladesh Citizen', 'Permanent Resident', 'International']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                controller.selectedCitizenshipStatus = value!;
              },
            ),
            AppConstrains.height10,
            AppConstrains.height10,
            TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: controller.medicalConditionsController,
              maxLines: 5,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.healing),
                hintText: 'Medical Conditions or Allergies',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            AppConstrains.height10,
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  height: 53,
                  onTap: () {
                    Get.to(const UserformationView());
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
