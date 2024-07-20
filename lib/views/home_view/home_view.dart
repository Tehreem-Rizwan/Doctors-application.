import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorsapp/consts/colors.dart';
import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/consts/lists.dart';
import 'package:doctorsapp/controllers/home_controller.dart';
import 'package:doctorsapp/res/components/custom_textfield.dart';
import 'package:doctorsapp/views/category_details_view/category_details_view.dart';
import 'package:doctorsapp/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:doctorsapp/views/search_view/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.blueColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "${AppStrings.welcome} User",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              height: 100,
              color: AppColors.blueColor,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      textController: controller.searchQueryController,
                      hint: AppStrings.search,
                      bordercolor: AppColors.whitecolor,
                      textcolor: AppColors.whitecolor,
                      inputcolor: AppColors.whitecolor,
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      Get.to(() => SearchView(
                            searchQuery: controller.searchQueryController.text,
                          ));
                    },
                    icon: Icon(
                      Icons.search,
                      color: AppColors.whitecolor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => CategoryDetailView(
                                catName: iconsTitleList[index]));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: EdgeInsets.all(12),
                            margin: const EdgeInsets.only(right: 8),
                            child: Column(
                              children: [
                                Image.asset(
                                  iconsList[index],
                                  width: 30,
                                  color: AppColors.whitecolor,
                                ),
                                SizedBox(height: 5),
                                AppStyles.regular(
                                  title: iconsTitleList[index],
                                  color: AppColors.whitecolor,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppStrings.popularDoctors,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.blueColor,
                      ),
                    ),
                  ),
                  10.heightBox,
                  FutureBuilder<QuerySnapshot>(
                    future: controller.getDoctorList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var data = snapshot.data?.docs;

                        return SizedBox(
                          height: 150,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => DoctorProfileView(
                                        doc: data[index],
                                      ));
                                },
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 239, 234, 234),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  margin: EdgeInsets.only(right: 8),
                                  height: 100,
                                  width: 150,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 150,
                                        alignment: Alignment.center,
                                        color: AppColors.blueColor,
                                        child: Image.asset(
                                          AppAssets.imgdoctor,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      AppStyles.regular(
                                          title: data![index]['docName']),
                                      SizedBox(height: 5),
                                      AppStyles.regular(
                                        title: data[index]['docCategory'],
                                        color: Colors.black54,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AppStyles.regular(
                        title: "View All",
                        color: AppColors.blueColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => Container(
                        decoration: BoxDecoration(
                          color: AppColors.blueColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Image.asset(
                              AppAssets.icBody,
                              width: 25,
                              color: AppColors.whitecolor,
                            ),
                            SizedBox(height: 5),
                            AppStyles.regular(
                              title: "Lab Test",
                              color: AppColors.whitecolor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
