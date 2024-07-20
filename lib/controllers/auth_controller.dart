import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/controllers/appointment_controller.dart';
import 'package:doctorsapp/views/home_view/home.dart';
import 'package:doctorsapp/views/login_view/login_view.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  //doctor editing controller
  var aboutController = TextEditingController();
  var cateogryController = TextEditingController();
  var serviceController = TextEditingController();
  var addressController = TextEditingController();
  var phonenumberController = TextEditingController();
  var TimingController = TextEditingController();

  UserCredential? userCredential;
  isUserAlreadyLoggedIn() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user != null) {
        var data = await FirebaseFirestore.instance
            .collection('doctors')
            .doc(user.uid)
            .get();
        var isDoc = data.data()?.containsKey('docName') ?? false;
        if (isDoc) {
          Get.offAll(() => AppointmentController());
        }
        Get.offAll(Home());
      } else {
        Get.offAll(LoginView());
      }
    });
  }

  loginUser() async {
    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
  }

  signupUser(bool isDoctor) async {
    userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    if (userCredential!.user != null) {
      await storeUserData(userCredential!.user!.uid, fullnameController.text,
          emailController.text, isDoctor);
    }
  }

  storeUserData(
      String uid, String fullname, String email, bool isDoctor) async {
    var store = FirebaseFirestore.instance
        .collection(isDoctor ? 'Doctors' : 'users')
        .doc(uid);
    if (isDoctor) {
      await store.set({
        "docAbout": aboutController.text,
        "docCategory": cateogryController.text,
        "docPhoneNumber": phonenumberController.text,
        "docService": serviceController.text,
        "docTiming": TimingController.text,
        "docAddress": addressController.text,
        "docname": fullnameController.text,
        "docid": FirebaseAuth.instance.currentUser?.uid,
        "docRating": 1,
        "docEmail": email,
      });
    } else {
      await store.set({
        'fullname': fullname,
        'email': email,
      });
    }
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
