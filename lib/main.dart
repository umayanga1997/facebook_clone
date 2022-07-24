import 'package:flutter/material.dart';
import 'package:facebook_clone/helps/colors.dart';
import 'package:facebook_clone/layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: facebookwhite,
        backgroundColor: facebookwhite,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      // theme: ThemeData(
      //   primaryColor: facebookgrey,
      // ),
      debugShowCheckedModeBanner: false,
      home: const LayoutScreen(),
    );
  }
}
