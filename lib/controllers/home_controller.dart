import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  getDoctorList() async {
    var doctors = FirebaseFirestore.instance.collection("doctos").snapshots();
    return doctors;
  }
}
