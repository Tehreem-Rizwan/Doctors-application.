import 'package:doctorsapp/consts/const.dart';
import 'package:flutter/cupertino.dart';

class AppointmentDetailView extends StatelessWidget {
  const AppointmentDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Doctor Name",
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
            Text("Select Appointment Day",
                style: TextStyle(fontWeight: FontWeight.bold)),
            5.heightBox,
            AppStyles.regular(title: "Selected Day"),
            10.heightBox,
            Text("Select Appointment Time",
                style: TextStyle(fontWeight: FontWeight.bold)),
            5.heightBox,
            AppStyles.regular(title: "Selected Time"),
            20.heightBox,
            Text("Mobile Number",
                style: TextStyle(fontWeight: FontWeight.bold)),
            5.heightBox,
            AppStyles.regular(title: "Mobile Number"),
            10.heightBox,
            Text("Full Name", style: TextStyle(fontWeight: FontWeight.bold)),
            5.heightBox,
            AppStyles.regular(title: "Name"),
            10.heightBox,
            Text("Message", style: TextStyle(fontWeight: FontWeight.bold)),
            5.heightBox,
            AppStyles.regular(title: "Message"),
          ],
        ),
      ),
    );
  }
}
