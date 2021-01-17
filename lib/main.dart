import 'package:flutter/material.dart';
import 'Homepage.dart';
import './Pages/signin_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Stack(
        children: [
          //HomePage(),
          Signinpage()
          //Sidebar()
        ],
      ),
    );
  }
}
