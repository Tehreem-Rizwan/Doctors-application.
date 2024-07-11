import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/views/appointment_detail_view/appointment_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Appointments",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.whitecolor,
              fontSize: AppSizes.size18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  Get.to(() => AppointmentDetailView());
                },
                leading: CircleAvatar(
                  child: Image.asset(AppAssets.imgdoctor),
                ),
                title: Text(
                  "Doctor Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: AppStyles.regular(
                    title: "Appointment Time",
                    color: AppColors.textColor.withOpacity(0.5)),
              );
            }),
      ),
    );
  }
}
