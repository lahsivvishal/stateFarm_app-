import 'package:flutter/material.dart';
import 'Pages/Messages.dart';
import 'Pages/Preferences.dart';
import 'Pages/Usage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage;

  void initState() {
    super.initState();
    _selectedPage = 0;
  }

  List _pageOptions = [Messages(), Preferences(), Usage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(203, 33, 33, 1),
        elevation: 0,
      ),
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          backgroundColor: Colors.white,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text('Messages',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              icon: Icon(Icons.email_outlined, color: Colors.grey),
              activeIcon: Icon(Icons.email_outlined, color: Colors.red),
            ),
            BottomNavigationBarItem(
              title: Text('Preferences',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              icon: Icon(Icons.star, color: Colors.grey),
              activeIcon: Icon(Icons.star, color: Colors.red),
            ),
            BottomNavigationBarItem(
              title: Text(
                'Usage',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              icon: Icon(Icons.data_usage, color: Colors.grey),
              activeIcon: Icon(Icons.data_usage, color: Colors.red),
            )
          ]),
    );
  }
}
