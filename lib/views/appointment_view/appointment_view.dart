import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/controllers/appointment_controller.dart';
import 'package:doctorsapp/views/appointment_detail_view/appointment_detail_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());
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
        body: FutureBuilder<QuerySnapshot>(
            future: controller.getAppointments(),
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
                  child: ListView.builder(
                      itemCount: data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () {
                            Get.to(() => AppointmentDetailView(
                                  doc: data[index],
                                ));
                          },
                          leading: CircleAvatar(
                            child: Image.asset(AppAssets.imgdoctor),
                          ),
                          title: Text(
                            data![index]['appWithName'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: AppStyles.regular(
                              title:
                                  "${data[index]['appDay']}-${data[index]['appTime']}",
                              color: AppColors.textColor.withOpacity(0.5)),
                        );
                      }),
                );
              }
            }));
  }
}
