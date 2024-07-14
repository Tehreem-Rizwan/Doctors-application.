import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/consts/lists.dart';
import 'package:doctorsapp/controllers/auth_controller.dart';
import 'package:doctorsapp/views/login_view/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              child: Image.asset(AppAssets.imgdoctor),
            ),
            title: Text(
              "Username",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: AppStyles.regular(title: "username@gmail.com"),
          ),
          const Divider(),
          10.heightBox,
          ListView(
            shrinkWrap: true,
            children: List.generate(
              SettingsList.length,
              (index) => ListTile(
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
