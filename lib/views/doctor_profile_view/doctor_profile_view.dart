import 'package:doctorsapp/consts/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          "Doctor Name",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.whitecolor,
              fontSize: AppSizes.size18),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  child: Image.asset(AppAssets.imgdoctor),
                ),
                Column(
                  children: [],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
