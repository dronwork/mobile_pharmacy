import 'package:mobile_pharmacy/main_list.dart';
import 'package:flutter/material.dart';

void main() => runApp(BaseScreen());

class BaseScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SystemScreen(),
    );
  }
}