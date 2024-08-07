import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/consts/images.dart';
import 'package:doctorsapp/consts/strings.dart';
import 'package:doctorsapp/controllers/auth_controller.dart';
import 'package:doctorsapp/res/components/custom_button.dart';
import 'package:doctorsapp/res/components/custom_textfield.dart';
import 'package:doctorsapp/views/appointment_view/appointment_view.dart';
import 'package:doctorsapp/views/home_view/home.dart';

import 'package:doctorsapp/views/sign_up/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.icLogin,
                  width: 200,
                ),
                10.heightBox,
                Text(AppStrings.welcomeBack,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                AppStyles.regular(title: AppStrings.weAreExcited),
              ],
            ),
            40.heightBox,
            Expanded(
                child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      hint: AppStrings.email,
                      textController: controller.emailController,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.password,
                      textController: controller.passwordController,
                    ),
                    10.heightBox,
                    SwitchListTile(
                        value: isDoctor,
                        onChanged: (newValue) {
                          setState(
                            () {
                              isDoctor = newValue;
                            },
                          );
                        },
                        title: "Sign in as a doctor".text.make()),
                    20.heightBox,
                    Align(
                        alignment: Alignment.centerRight,
                        child: AppStyles.regular(
                            title: AppStrings.forgetPassword)),
                    20.heightBox,
                    CustomButton(
                      buttonText: AppStrings.login,
                      onTap: () async {
                        await controller.loginUser();
                        if (controller.userCredential != null) {
                          if (isDoctor) {
                            Get.to(() => AppointmentView());
                          } else {
                            Get.to(() => Home());
                          }
                        }
                      },
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppStyles.regular(title: AppStrings.dontHaveAccount),
                        8.widthBox,
                        GestureDetector(
                          onTap: () {
                            Get.to(() => SignUpView());
                          },
                          child: Text(
                            AppStrings.signup,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
