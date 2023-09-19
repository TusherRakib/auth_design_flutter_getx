import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationController extends GetxController {
  String selectedGender = 'Male';
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  // Parent/Guardian Information
  TextEditingController parentGuardianNameController = TextEditingController();
  TextEditingController parentGuardianEmailController = TextEditingController();
  TextEditingController parentGuardianPhoneController = TextEditingController();

  // Academic Information
  TextEditingController studentIdController = TextEditingController();
  TextEditingController schoolCollegeNameController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  TextEditingController yearOfStudyController = TextEditingController();

  // Admission Information
  TextEditingController desiredStartDateController = TextEditingController();
  String selectedAdmissionType = 'Freshman';

  // Emergency Contact
  TextEditingController emergencyContactNameController = TextEditingController();
  TextEditingController emergencyContactPhoneController = TextEditingController();
  TextEditingController relationshipToStudentController = TextEditingController();

  String selectedCitizenshipStatus = 'Bangladesh Citizen';
  TextEditingController medicalConditionsController = TextEditingController();

  // Username and Password
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Consent and Agreements
  RxBool acceptedTerms = false.obs;
  RxBool agreedToPrivacyPolicy = false.obs;

  TextEditingController dateOfBirthController = TextEditingController();

  Rx<File> image = File("").obs;

  Future<void> pickImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image.value = File(pickedFile.path);
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dateOfBirthController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    streetController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();

    parentGuardianNameController.dispose();
    parentGuardianEmailController.dispose();
    parentGuardianPhoneController.dispose();

    studentIdController.dispose();
    schoolCollegeNameController.dispose();
    majorController.dispose();
    yearOfStudyController.dispose();

    desiredStartDateController.dispose();

    emergencyContactNameController.dispose();
    emergencyContactPhoneController.dispose();
    relationshipToStudentController.dispose();

    medicalConditionsController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }
}
