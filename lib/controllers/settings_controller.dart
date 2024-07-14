import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData = getUserData();
  }

  var isLoading = false.obs;
  var currentUser = FirebaseAuth.instance.currentUser;
  var username = ''.obs;
  var email = ''.obs;
  Future? getData;

  Future<void> getUserData() async {
    try {
      isLoading.value = true;
      DocumentSnapshot<Map<String, dynamic>> user = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();

      var userData = user.data();
      if (userData != null) {
        username.value = userData['fullname'] ?? '';
        email.value = currentUser!.email ?? '';
      }
    } catch (e) {
      print('Error fetching user data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
