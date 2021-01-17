import 'package:flutter/material.dart';

class GreyLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        alignment: Alignment.center,
        height: 2,
        color: Colors.grey[300],
      ),
    );
  }
}
