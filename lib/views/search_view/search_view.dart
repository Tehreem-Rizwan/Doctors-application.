import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorsapp/consts/colors.dart';
import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/consts/images.dart';
import 'package:doctorsapp/views/doctor_profile_view/doctor_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;
  const SearchView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.blueColor,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Search Results",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('doctors').get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 170,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    var doc = snapshot.data!.docs[index];
                    return !(doc["docName"].toString().toLowerCase())
                            .contains(searchQuery.toLowerCase())
                        ? SizedBox.shrink()
                        : GestureDetector(
                            onTap: () {
                              Get.to(() => DoctorProfileView(doc: doc));
                            },
                            child: Container(
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
                                  AppStyles.regular(
                                      title: doc[index]['docName']),
                                  VxRating(
                                    selectionColor: AppColors.yellowColor,
                                    onRatingUpdate: (value) {},
                                    maxRating: 5,
                                    count: 5,
                                    value: double.parse(
                                        doc['docRating'].toString()),
                                    stepInt: true,
                                  ),
                                  5.heightBox,
                                ],
                              ),
                            ));
                  },
                ),
              );
            }
          }),
    );
  }
}
