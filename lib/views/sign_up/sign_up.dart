import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/consts/images.dart';
import 'package:doctorsapp/consts/strings.dart';
import 'package:doctorsapp/controllers/auth_controller.dart';
import 'package:doctorsapp/res/components/custom_button.dart';
import 'package:doctorsapp/res/components/custom_textfield.dart';
import 'package:doctorsapp/views/home_view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  var isDoctor = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 70),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.imgSignup,
                  width: 200,
                ),
                30.heightBox,
                Text(AppStrings.signupnow,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              ],
            ),
            40.heightBox,
            Expanded(
                child: Form(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      hint: AppStrings.fullname,
                      textController: controller.fullnameController,
                    ),
                    10.heightBox,
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
                        title: "Sign Up as a Doctor".text.make(),
                        value: isDoctor,
                        onChanged: (newValue) {
                          setState(() {
                            isDoctor = newValue;
                          });
                        }),
                    Visibility(
                      visible: isDoctor,
                      child: Column(
                        children: [
                          CustomTextField(
                            hint: "About",
                            textController: controller.aboutController,
                          ),
                          10.heightBox,
                          CustomTextField(
                            hint: "Category",
                            textController: controller.cateogryController,
                          ),
                          10.heightBox,
                          CustomTextField(
                            hint: "Services",
                            textController: controller.serviceController,
                          ),
                          10.heightBox,
                          CustomTextField(
                            hint: "Address",
                            textController: controller.addressController,
                          ),
                          10.heightBox,
                          CustomTextField(
                            hint: "Phone Number",
                            textController: controller.phonenumberController,
                          ),
                          10.heightBox,
                          CustomTextField(
                            hint: "Timing",
                            textController: controller.TimingController,
                          ),
                        ],
                      ),
                    ),
                    40.heightBox,
                    CustomButton(
                      buttonText: AppStrings.signup,
                      onTap: () async {
                        await controller.signupUser(isDoctor);
                        if (controller.userCredential != null) {
                          Get.offAll(() => Home());
                        }
                      },
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppStyles.regular(title: AppStrings.alreadyHaveAccount),
                        8.widthBox,
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            AppStrings.login,
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
