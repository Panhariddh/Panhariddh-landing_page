import 'package:flutter/material.dart';
import 'package:landing_page/screens/category_screen.dart';
import 'package:landing_page/screens/landing_screen.dart';
import 'package:landing_page/screens/my_course_screen.dart';
import 'package:landing_page/screens/online_course_screen.dart';
import 'package:landing_page/screens/search_screen.dart';
import 'package:landing_page/screens/auth/login.screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Worktency',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return _createRoute(const LoginScreen());
          case '/explore':
            return _createRoute(const LandingScreen());
          case '/search':
            return _createRoute(const SearchScreen());
          case '/myCourses':
            return _createRoute(const MyCourseScreen());
          case '/onlineCourses':
            return _createRoute(const OnlineCourseScreen());
          case '/category':
            return _createRoute(const CategoryScreen());
          default:
            return null;
        }
      },
    );
  }
}