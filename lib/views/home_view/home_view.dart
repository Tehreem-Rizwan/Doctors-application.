import 'package:doctorsapp/consts/colors.dart';
import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/consts/lists.dart';
import 'package:doctorsapp/res/components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.blueColor,
          title: Text(
            "Welcome User",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            height: 100,
            color: AppColors.blueColor,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hint: AppStrings.search,
                    bordercolor: AppColors.whitecolor,
                    textcolor: AppColors.whitecolor,
                  ),
                ),
                10.widthBox,
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: AppColors.whitecolor,
                  ),
                )
              ],
            ),
          ),
          20.heightBox,
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
                            onTap: () {},
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
                                  5.heightBox,
                                  AppStyles.regular(
                                    title: iconsTitleList[index],
                                    color: AppColors.whitecolor,
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
                20.heightBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppStrings.popularDoctors,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.blueColor)),
                ),
                10.heightBox,
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 239, 234, 234),
                              borderRadius: BorderRadius.circular(12)),
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
                              5.heightBox,
                              AppStyles.regular(title: "Doctor Name"),
                              5.heightBox,
                              AppStyles.regular(
                                  title: "Category", color: Colors.black54)
                            ],
                          ),
                        );
                      }),
                ),
                5.heightBox,
                GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AppStyles.regular(
                          title: "View All", color: AppColors.blueColor),
                    )),
                20.heightBox,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        4,
                        (index) => Container(
                              decoration: BoxDecoration(
                                  color: AppColors.blueColor,
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Image.asset(
                                    AppAssets.icBody,
                                    width: 25,
                                    color: AppColors.whitecolor,
                                  ),
                                  5.heightBox,
                                  AppStyles.regular(
                                      title: "Lab Test",
                                      color: AppColors.whitecolor)
                                ],
                              ),
                            )))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
