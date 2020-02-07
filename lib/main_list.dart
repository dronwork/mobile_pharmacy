import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_pharmacy/ui/profile_screen.dart';
import 'package:mobile_pharmacy/ui/settings_screen.dart';
import 'package:mobile_pharmacy/ui/info_screen.dart';
import 'package:mobile_pharmacy/ui/recept_screen.dart';
import 'package:mobile_pharmacy/ui/chat_screen.dart';

void main() {
  runApp(SystemScreen());
}

class SystemScreen extends StatefulWidget {
  @override
  _SystemScreenState createState() => _SystemScreenState();
}

class _SystemScreenState extends State<SystemScreen> {
  Choice _selectedChoice = choices[0];

  Profile profile = new Profile();
  Settings settings = new Settings();
  Info info = new Info();
  Recept recept = new Recept();
  Chat chat = new Chat();

  void _select(Choice choice) {
    setState(() {
      _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('009.am', textScaleFactor: 1.5),
          actions: <Widget>[

            PopupMenuButton<Choice>(
              icon: Icon(Icons.filter_3, size: 37,),
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ChoiceCard(choice: _selectedChoice),
        ),
        persistentFooterButtons: <Widget>[

          IconButton(
              icon: Icon(Icons.chat, size: 40, semanticLabel: 'Чат', color: Colors.deepPurple),
              onPressed: () {chat.openPageChat(context);},

             ),

          IconButton(
              icon: Icon(Icons.account_circle, size: 40, semanticLabel: 'Профиль', color: Colors.black26),
              onPressed: () {profile.openPageProfile(context);},

              ),

          IconButton(
              icon: Icon(Icons.add_box, size: 40, semanticLabel: 'Рецепты', color: Colors.blue),
              onPressed: () {recept.openPageRecept(context);},

              ),


          IconButton(
              icon: Icon(Icons.settings, size: 40, semanticLabel: 'Настройки', color: Colors.deepOrange),
              onPressed: () {settings.openPageSettings(context);},

              ),


          IconButton(
              icon: Icon(Icons.info_outline, size: 40, semanticLabel: 'Info', color: Colors.green),
              onPressed: () {info.openPageInfo(context);},

              ),
        ],
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: choice.list.length,
        itemBuilder: (c, i) => Card(
          elevation: 2,
          color: Colors.white,
          child: Center(
            heightFactor: 2.5,
            child: Text(choice.list[i].toString(), maxLines: 3, style: TextStyle(color: Colors.green),
            ),
          ),
        )
    );
  }
}

class Choice {
  const Choice({this.title, this.list});

  final String title;
  final List<dynamic> list;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Все', list: [
    'Новость-1',
    'Новость-2',
    'Новость-3',
    'Новость-4',
    'Новость-5',
    'Новость-6',
    'РЕЦЕПТ-1',
    'РЕЦЕПТ-2',
    'РЕЦЕПТ-3',
    'РЕЦЕПТ-4',
    'РЕЦЕПТ-5',
  ]),
  const Choice(title: 'Новости', list: ['Новость-1', 'Новость-2', 'Новость-3','Новость-4','Новость-5','Новость-6']),
  const Choice(title: 'Рецепты', list: ['РЕЦЕПТ-1', 'РЕЦЕПТ-2', 'РЕЦЕПТ-3','РЕЦЕПТ-4','РЕЦЕПТ-5']),
];