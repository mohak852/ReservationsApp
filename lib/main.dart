import 'package:flutter/material.dart';
import 'package:login_app/screens/Dashboard_page.dart';
import 'package:login_app/screens/History_page.dart';
import 'package:login_app/screens/login_screen.dart';
import 'package:login_app/screens/signuo_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/SignupPage':(BuildContext context) => SignUp(),
        '/LoginScreen':(BuildContext context) => LoginScreen(),
        '/DashBoardPage':(BuildContext context) =>DashboardPage(),
        '/HistoryPage':(BuildContext context) =>HistoryPage()
      },
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
