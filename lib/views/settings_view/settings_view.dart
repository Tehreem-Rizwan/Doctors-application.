import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/consts/lists.dart';
import 'package:doctorsapp/controllers/auth_controller.dart';
import 'package:doctorsapp/controllers/settings_controller.dart';
import 'package:doctorsapp/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.blue,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Settings",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Image.asset(AppAssets.imgdoctor),
                    ),
                    title: Text(
                      controller.username.value,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      controller.email.value,
                      style: TextStyle(),
                    ),
                  ),
                  const Divider(),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: SettingsList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            if (index == 2) {
                              AuthController().signout();
                              Get.offAll(() => LoginView());
                            }
                          },
                          leading: Icon(
                            SettingsListicon[index],
                            color: AppColors.blueColor,
                          ),
                          title: Text(
                            SettingsList[index],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
