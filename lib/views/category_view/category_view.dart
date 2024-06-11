import 'package:doctorsapp/consts/lists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doctorsapp/consts/const.dart';
import 'package:flutter/widgets.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.blue,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              "Category",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 200),
              itemCount: iconsList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          alignment: Alignment.center,
                          child: Image.asset(iconsList[index],
                              width: 60, color: AppColors.whitecolor),
                        ),
                        20.heightBox,
                        Text(iconsTitleList[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColors.whitecolor,
                            )),
                        10.heightBox,
                        Text("13 Specialists",
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.whitecolor.withOpacity(0.5),
                            )),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
