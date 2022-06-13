import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plastivalidation/data/font.data.dart';
import 'package:plastivalidation/data/pallete.data.dart';

import 'package:sizer/sizer.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:dotted_line/dotted_line.dart';

import '../controller/controller.login.dart';
import 'components/component.button.dart';
import 'components/component.input.dart';
import 'components/component.inputPassword.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({Key? key}) : super(key: key);

  @override
  _LogInWidgetState createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.h),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                              'assets/icons/fi-rr-cross-small.svg'),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Image.asset('assets/logo/logo.jpg'),
                      Text(
                        "Connecter pour valider les tickets",
                        style: TextStyle(fontSize: 10.sp, fontWeight: medium),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      InputComponent(
                        leadingIcon: 'assets/icons/fi-rr-envelope.svg',
                        hintText: 'email'.tr,
                        textEditingController: controller.emailController,
                        validate: controller.validateEmail,
                      ),
                      SizedBox(height: 2.h),
                      InputComponentPassword(
                        hintText: 'password'.tr,
                        textEditingController: controller.passwordController,
                        validate: controller.validatePassword,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Obx(() => controller.isUpdating.value == false
                          ? button("Se connecter", () async {
                              FocusManager.instance.primaryFocus?.unfocus();

                              await controller.login();
                            })
                          : CircularProgressIndicator()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

Widget containerConnectWith(String icon) => Container(
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        border: Border.all(color: KOrange),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        "assets/icons/$icon.svg",
        height: 20,
        width: 20,
        color: KOrange,
      ),
    );
