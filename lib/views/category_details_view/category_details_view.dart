import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorsapp/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:doctorsapp/consts/const.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryDetailView extends StatelessWidget {
  final String catName;
  const CategoryDetailView({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            catName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.whitecolor,
                fontSize: AppSizes.size18),
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance
                .collection('doctors')
                .where('docCategory', isEqualTo: catName)
                .get(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var data = snapshot.data?.docs;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 170,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8),
                    itemCount: data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        margin: EdgeInsets.only(right: 8),
                        height: 100,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              color: AppColors.blueColor,
                              child: Image.asset(
                                width: 120,
                                AppAssets.imgdoctor,
                                fit: BoxFit.cover,
                              ),
                            ),
                            5.heightBox,
                            AppStyles.regular(title: data![index]['docName']),
                            VxRating(
                              selectionColor: AppColors.yellowColor,
                              onRatingUpdate: (value) {},
                              maxRating: 5,
                              count: 5,
                              value: double.parse(
                                  data[index]['docRating'].toString()),
                              stepInt: true,
                            ),
                            5.heightBox,
                          ],
                        ),
                      ).onTap(() {
                        Get.to(() => DoctorProfileView(doc: data[index]));
                      });
                    },
                  ),
                );
              }
            }));
  }
}
