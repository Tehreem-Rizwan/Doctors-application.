import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorsapp/consts/const.dart';
import 'package:flutter/cupertino.dart';

class AppointmentDetailView extends StatelessWidget {
  final DocumentSnapshot doc;
  const AppointmentDetailView({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          doc['appWithName'],
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.whitecolor,
              fontSize: AppSizes.size18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Appointment day",
                style: TextStyle(fontWeight: FontWeight.bold)),
            5.heightBox,
            AppStyles.regular(title: doc['appDay']),
            10.heightBox,
            Text("Select appointment Time",
                style: TextStyle(fontWeight: FontWeight.bold)),
            5.heightBox,
            AppStyles.regular(title: doc['appTime']),
            20.heightBox,
            Text("Mobile Number",
                style: TextStyle(fontWeight: FontWeight.bold)),
            5.heightBox,
            AppStyles.regular(title: doc['appMobile']),
            10.heightBox,
            Text("Full Name", style: TextStyle(fontWeight: FontWeight.bold)),
            5.heightBox,
            AppStyles.regular(title: doc['appName']),
            10.heightBox,
            Text("Message", style: TextStyle(fontWeight: FontWeight.bold)),
            5.heightBox,
            AppStyles.regular(title: doc['appMsg']),
          ],
        ),
      ),
    );
  }
}
