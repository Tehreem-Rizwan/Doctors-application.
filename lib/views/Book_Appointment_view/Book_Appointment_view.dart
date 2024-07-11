import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/res/components/custom_button.dart';
import 'package:doctorsapp/res/components/custom_textfield.dart';
import 'package:flutter/cupertino.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

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
        child: CustomButton(buttonText: "Book and Appointment", onTap: () {}),
      ),
    );
  }
}
