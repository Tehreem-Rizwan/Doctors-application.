import 'package:doctorsapp/consts/const.dart';
import 'package:doctorsapp/views/Appointment_view/Appointment_view.dart';
import 'package:doctorsapp/views/category_view/category_view.dart';
import 'package:doctorsapp/views/doctors_view/doctorsview.dart';
import 'package:doctorsapp/views/home_view/home_view.dart';
import 'package:doctorsapp/views/settings_view/settings_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedindex = 0;
  List screenList = [
    HomeView(),
    AppointmentView(),
    CategoryView(),
    DoctorsView(),
    SettingsView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedindex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white.withOpacity(0.5),
        selectedItemColor: AppColors.whitecolor,
        selectedLabelStyle: TextStyle(color: AppColors.whitecolor),
        selectedIconTheme: IconThemeData(color: AppColors.whitecolor),
        backgroundColor: AppColors.blueColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedindex,
        onTap: (value) {
          setState(() {
            selectedindex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book), label: "Appointments"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Doctor"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
    );
  }
}
