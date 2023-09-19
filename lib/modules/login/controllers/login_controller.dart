import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  RxBool obscureText = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
