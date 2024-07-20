import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctorsapp/consts/const.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  var searchQueryController = TextEditingController();
  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorList() async {
    var doctors = FirebaseFirestore.instance.collection("doctors").get();
    return doctors;
  }
}
