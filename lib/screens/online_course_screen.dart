import 'package:flutter/material.dart';
import 'package:landing_page/widgets/home/app_bar.dart';


import '../widgets/home/button_nav.dart';

class OnlineCourseScreen extends StatefulWidget {
  const OnlineCourseScreen({super.key});

  @override
  State<OnlineCourseScreen> createState() => _OnlineCourseScreenState();
}

class _OnlineCourseScreenState extends State<OnlineCourseScreen> {
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: const AppBarComponent(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
        ),
      ),
      bottomNavigationBar: ButtonNavigate(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/myCourses');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/onlineCourses');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/category');
              break;
          }
        },
      ),
    );
  }
}