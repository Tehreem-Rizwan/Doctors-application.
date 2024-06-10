import 'package:doctorsapp/consts/lists.dart';
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
                  mainAxisExtent: 220),
              itemCount: iconsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 229, 232, 234),
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(iconsList[index],
                            width: 60, color: Vx.randomPrimaryColor),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      20.heightBox,
                      Text(iconsTitleList[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.textColor,
                          )),
                      10.heightBox,
                      Text("13 Specialists",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.textColor.withOpacity(0.5),
                          )),
                    ],
                  ),
                );
              }),
        ));
  }
}
