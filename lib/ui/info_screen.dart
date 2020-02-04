import 'package:flutter/material.dart';
import 'package:mobile_pharmacy/main_list.dart';
import 'package:mobile_pharmacy/main.dart';
import 'package:mobile_pharmacy/ui/test_screen.dart';

class Info {
//SystemScreen sys_screen = new SystemScreen();
  void openPageInfo(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: const Text('Настройки', style: TextStyle(color: Colors.white),),
          ),
          body: const Center(
            child: Text(
              'Информация!',
              style: TextStyle(fontSize: 24),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BaseScreen()),);
            },
            label: Text('На главную'),
            icon: Icon(Icons.home),
            backgroundColor: Colors.green,
          ),
        );
      },
    ));
  }
}