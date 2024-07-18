import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/controllers/appointment_controller.dart';
import 'package:doctorsapp/res/components/custom_button.dart';
import 'package:doctorsapp/res/components/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BookAppointmentView extends StatelessWidget {
  final String docid;
  final String docname;
  const BookAppointmentView(
      {super.key, required this.docid, required this.docname});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppointmentController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          docname,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.whitecolor,
              fontSize: AppSizes.size18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select Appointment Day",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              5.heightBox,
              CustomTextField(hint: "Select Day"),
              10.heightBox,
              Text("Select Appointment Time",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              5.heightBox,
              CustomTextField(hint: "Select Time"),
              20.heightBox,
              Text("Mobile Number",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              5.heightBox,
              CustomTextField(hint: "Enter your mobile number"),
              10.heightBox,
              Text("Full Name", style: TextStyle(fontWeight: FontWeight.bold)),
              5.heightBox,
              CustomTextField(hint: "Enter your name"),
              10.heightBox,
              Text("Message", style: TextStyle(fontWeight: FontWeight.bold)),
              5.heightBox,
              CustomTextField(hint: "Enter your message"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
            buttonText: "Book and Appointment",
            onTap: () async {
              await controller.BookAppointment(docid, context);
              Get.back();
            }),
      ),
    );
  }
}
