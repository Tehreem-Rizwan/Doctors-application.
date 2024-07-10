import 'package:doctorsapp/consts/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DoctorProfileView extends StatelessWidget {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 231, 231),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Doctor Name",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.whitecolor,
              fontSize: AppSizes.size18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Image.asset(AppAssets.imgdoctor),
                    ),
                    10.widthBox,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Doctor Name",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor,
                                fontSize: AppSizes.size14),
                          ),
                          Text(
                            "Category",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColor.withOpacity(0.5),
                                fontSize: AppSizes.size12),
                          ),
                          Spacer(),
                          VxRating(
                            selectionColor: AppColors.yellowColor,
                            onRatingUpdate: (value) {},
                            maxRating: 5,
                            count: 5,
                            value: 4,
                            stepInt: true,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "See all Reviews",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blueColor,
                          fontSize: AppSizes.size12),
                    ),
                  ],
                ),
              ),
              10.heightBox,
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        "Phone Number",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.size16,
                          color: AppColors.textColor,
                        ),
                      ),
                      subtitle: AppStyles.regular(
                          title: "+923207166412",
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
                    ),
                    10.heightBox,
                    Text(
                      "About",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.size16,
                        color: AppColors.textColor,
                      ),
                    ),
                    5.heightBox,
                    AppStyles.regular(
                        title: "This is the about section of the doctor",
                        color: AppColors.textColor.withOpacity(0.5),
                        size: AppSizes.size12),
                    10.heightBox,
                    Text(
                      "Address",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.size16,
                        color: AppColors.textColor,
                      ),
                    ),
                    5.heightBox,
                    AppStyles.regular(
                        title: "Address of the Doctor",
                        color: AppColors.textColor.withOpacity(0.5),
                        size: AppSizes.size12),
                    10.heightBox,
                    Text(
                      "Working Time",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.size16,
                        color: AppColors.textColor,
                      ),
                    ),
                    5.heightBox,
                    AppStyles.regular(
                        title: "9:00 AM to 12:00 PM",
                        color: AppColors.textColor.withOpacity(0.5),
                        size: AppSizes.size12),
                    10.heightBox,
                    Text(
                      "Services",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.size16,
                        color: AppColors.textColor,
                      ),
                    ),
                    5.heightBox,
                    AppStyles.regular(
                        title: "This is the services section of doctor",
                        color: AppColors.textColor.withOpacity(0.5),
                        size: AppSizes.size12),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
