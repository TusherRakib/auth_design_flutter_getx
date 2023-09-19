import 'dart:developer';

import 'package:auth_design_flutter_getx/modules/registration/views/additional_info_view.dart';
import 'package:auth_design_flutter_getx/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../utils/app_constraints.dart';
import '../controllers/registration_controller.dart';

class AcademicInformationView extends GetView<RegistrationController> {
  const AcademicInformationView({super.key});

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
                      'Academic Information',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.studentIdController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.school),
                        hintText: 'Student ID',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.schoolCollegeNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.school),
                        hintText: 'School/College Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.majorController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.school),
                        hintText: 'Major/Program',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.yearOfStudyController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.school),
                        hintText: 'Year of Study',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    AppConstrains.height20,
                    const Text(
                      'Admission Information',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      enableInteractiveSelection: false,
                      readOnly: true,
                      style: const TextStyle(color: Colors.black),
                      controller: controller.desiredStartDateController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today),
                        hintText: 'Desired Start Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

                          controller.desiredStartDateController.text = formattedDate;
                        } else {
                          log("Date is not selected");
                        }
                      },
                    ),
                    AppConstrains.height10,
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.school),
                        hintText: 'Admission Type',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      value: controller.selectedAdmissionType,
                      items: ['Freshman', 'Transfer'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedAdmissionType = value!;
                      },
                    ),
                    AppConstrains.height20,
                    const Text(
                      "Transcripts",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Obx(
                      () => GestureDetector(
                        onTap: () {
                          controller.pickImageFromGallery();
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          margin: EdgeInsets.only(right: Get.width / 1.5, top: 40),
                          color: controller.image.value.path == "" ? Colors.grey : Colors.transparent,
                          alignment: Alignment.center,
                          child: controller.image.value.path == ""
                              ? const Icon(Icons.add_a_photo_outlined)
                              : Image.file(controller.image.value),
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
                    if (controller.studentIdController.text == "") {
                      Get.snackbar("Alert!", "Student ID can not be empty",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.schoolCollegeNameController.text == "") {
                      Get.snackbar("Alert!", "Please Enter School/College name",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.majorController.text == "") {
                      Get.snackbar("Alert!", "Please enter Major Details",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.yearOfStudyController.text == "") {
                      Get.snackbar("Alert!", "Please Enter year of study",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.desiredStartDateController.text == "") {
                      Get.snackbar("Alert!", "Please enter your desired start date",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else {
                      Get.to(const AdditionalInformationView());
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
