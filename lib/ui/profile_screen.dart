import 'package:flutter/material.dart';

class Profile {

  void openPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
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
              //
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