import 'package:flutter/material.dart';
import 'package:mobile_pharmacy/main_list.dart';
import 'package:mobile_pharmacy/main.dart';

class Recept {

  void openPageRecept(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text('Рецепты пользователя'),
          ),
          body: const Center(
            child: Text(
              'Рецепты пользователя !',
              style: TextStyle(fontSize: 24, color: Colors.blue),
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