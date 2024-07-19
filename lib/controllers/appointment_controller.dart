import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorsapp/consts/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class AppointmentController extends GetxController {
  var isLoading = false.obs;
  var appDayController = TextEditingController();
  var appTimeController = TextEditingController();
  var appMobileController = TextEditingController();
  var appNameController = TextEditingController();
  var appMessageController = TextEditingController();

  BookAppointment(String docid, String docname, BuildContext context) async {
    isLoading(true);
    var store = FirebaseFirestore.instance.collection('appointments').doc();
    await store.set({
      'appBy': FirebaseAuth.instance.currentUser?.uid,
      'appDay': appDayController.text,
      'appTime': appTimeController.text,
      'appMobile': appMobileController.text,
      'appName': appNameController.text,
      'appMessage': appMessageController.text,
      'appID': docid,
      'appWithName': docname,
    });
    isLoading(false);
    VxToast.show(context, msg: "Appointment is booked successfully!");
    Get.back();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getAppointments() {
    return FirebaseFirestore.instance.collection('appointments').get();
  }
}
