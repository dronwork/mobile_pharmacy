import 'package:flutter/material.dart';
import 'package:mobile_pharmacy/main_list.dart';
import 'package:mobile_pharmacy/main.dart';

class Chat {

  void openPageChat(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text('CHAT'),
          ),
          body: const Center(
            child: Text(
              'CHAT !',
              style: TextStyle(fontSize: 24, color: Colors.deepPurple),
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