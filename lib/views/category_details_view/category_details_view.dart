import 'package:doctorsapp/consts/const.dart';
import 'package:flutter/cupertino.dart';

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Category Name",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.whitecolor,
                fontSize: AppSizes.size18),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 170,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
            itemCount: 10,
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
                    AppStyles.regular(title: "Doctor Name"),
                    VxRating(
                      selectionColor: AppColors.yellowColor,
                      onRatingUpdate: (value) {},
                      maxRating: 5,
                      count: 5,
                      value: 4,
                      stepInt: true,
                    ),
                    5.heightBox,
                  ],
                ),
              );
            },
          ),
        ));
  }
}
