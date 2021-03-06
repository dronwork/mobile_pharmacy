import 'package:flutter/material.dart';
import 'package:mobile_pharmacy/main_list.dart';
import 'package:mobile_pharmacy/main.dart';

class Profile {

  void openPageProfile(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black26,
            title: const Text('USER Profile'),
          ),
          body: const Center(
            child: Text(
              'Профиль пользователя !',
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