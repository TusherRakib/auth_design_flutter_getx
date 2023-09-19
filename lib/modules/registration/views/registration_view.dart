import 'dart:developer';

import 'package:auth_design_flutter_getx/modules/registration/views/parent_info_view.dart';
import 'package:auth_design_flutter_getx/utils/app_constraints.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../widgets/app_button.dart';
import '../controllers/registration_controller.dart';
import 'contact_information_view.dart';

class RegistrationView extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        backgroundColor: const Color(0xff22668D),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Personal Information
                    const Text(
                      'Personal Information',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.firstNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'First Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    AppConstrains.height10,
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: controller.lastNameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Last Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                    AppConstrains.height10,
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        hintText: 'Gender',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      value: controller.selectedGender,
                      items: ['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedGender = value!;
                      },
                    ),
                    AppConstrains.height10,
                    TextFormField(
                        enableInteractiveSelection: false,
                        readOnly: true,
                        style: const TextStyle(color: Colors.black),
                        controller: controller.dateOfBirthController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                          hintText: 'Date of Birth',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            log(formattedDate);

                            controller.dateOfBirthController.text = formattedDate;
                          } else {
                            log("Date is not selected");
                          }
                        }),
                    AppConstrains.height20,
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
                      keyboardType: TextInputType.emailAddress,
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
                      keyboardType: TextInputType.phone,
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
                    AppConstrains.height100,
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  height: 53,
                  onTap: () {
                    if (controller.firstNameController.text == "") {
                      Get.snackbar("Alert!", "First Name can not be empty",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.lastNameController.text == "") {
                      Get.snackbar("Alert!", "Last Name can not be empty",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.dateOfBirthController.text == "") {
                      Get.snackbar("Alert!", "Please Select Date Of Birth",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.emailController.text == "") {
                      Get.snackbar("Alert!", "Email can not be empty",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (!controller.emailController.text.contains("@")) {
                      Get.snackbar("Alert!", "Enter a Valid Email",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.dateOfBirthController.text == "") {
                      Get.snackbar("Alert!", "Phone number can not be empty",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else if (controller.dateOfBirthController.text == "") {
                      Get.snackbar("Alert!", "Address can not be empty",
                          snackPosition: SnackPosition.TOP, backgroundColor: Colors.white);
                    } else {
                      Get.to(const ParentInformationView());
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
