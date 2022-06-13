import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plastivalidation/views/widget.home.dart';

import '../constWidget/snackbar.const.dart';
import '../services/service.auth.dart';
import 'controller.local.dart';

import 'package:email_validator/email_validator.dart';

class LogInController extends GetxController {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var isUpdating = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void switchBool() {
    isUpdating.value = !isUpdating.value;
  }
  String? validateEmail(String? email) {
    if (emailController.text.isEmpty) {
      return "Adresse email invalid";
    }
    if (!EmailValidator.validate(emailController.text)) {
      return "Adresse email invalid";
    }
    return null;
  }
  String? validatePassword(String? password) {
    if (validateEmail("") == null) {
      if (passwordController.text.isEmpty) {
        return "Mot de passe invalid";
      }
      if (passwordController.text.length < 8) {
        return "Mot de passe invalid";
      }
      return null;
    }
    return null;
  }
  login() async {
    if (formKey.currentState?.validate() ?? true) {
      switchBool();
      var response = await AuthService.login(
          emailController.text, passwordController.text);
      switchBool();
      if (response) {
        Get.to(HomeWidget());
      } else {
        snackBarModel("echec".tr,"check_informations".tr  , true);
        //BottomBarController controller = Get.find<BottomBarController>();
        //controller.changeIndex(3);
      }
    }
  }
}
