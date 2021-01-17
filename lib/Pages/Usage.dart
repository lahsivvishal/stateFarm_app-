import 'package:flutter/material.dart';

class Usage extends StatefulWidget {
  @override
  _UsageState createState() => _UsageState();
}

class _UsageState extends State<Usage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(203, 33, 33, 1),
        title: Text('Usage'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('  Usage page \n Coming Soon...'),
      ),
    );
  }
}
