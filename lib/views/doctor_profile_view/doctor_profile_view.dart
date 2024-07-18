import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/res/components/custom_button.dart';
import 'package:doctorsapp/views/Book_Appointment_view/Book_Appointment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DoctorProfileView extends StatelessWidget {
  final DocumentSnapshot doc;
  const DoctorProfileView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 232, 231, 231),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Doctor Details',
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
                              doc['docName'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                  fontSize: AppSizes.size14),
                            ),
                            Text(
                              doc['docCategory'],
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
                              value: double.parse(doc['docRating'].toString()),
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
                            title: doc['docPhone'],
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
                          title: doc['docAbout'],
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
                          title: doc['docAddress'],
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
                          title: doc['docTiming'],
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
                          title: doc['docServices'],
                          color: AppColors.textColor.withOpacity(0.5),
                          size: AppSizes.size12),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomButton(
              buttonText: "Book and Appointment",
              onTap: () {
                Get.to(() => BookAppointmentView(
                      docid: doc['docID'],
                      docname: doc['docName'],
                    ));
              }),
        ));
  }
}
