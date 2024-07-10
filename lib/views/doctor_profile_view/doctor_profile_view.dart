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
                  children: [
                    ListTile(
                      title: AppStyles.bold(
                          title: "Phone Number", color: AppColors.textColor),
                      subtitle: AppStyles.regular(
                          title: "+923456916459",
                          color: AppColors.textColor.withOpacity(0.5),
                          size: AppSizes.size12),
                      trailing: Container(
                          width: 50,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.yellowColor),
                          child: Icon(
                            Icons.phone,
                            color: AppColors.whitecolor,
                          )),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
