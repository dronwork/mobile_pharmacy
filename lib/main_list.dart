import 'package:mobile_pharmacy/data_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_pharmacy/ui/profile_screen.dart';
import 'package:mobile_pharmacy/ui/settings_screen.dart';
import 'package:mobile_pharmacy/ui/info_screen.dart';
import 'package:mobile_pharmacy/ui/test_screen.dart';


class SystemScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SystemScreenState();
  }
}

class SystemScreenState extends State<SystemScreen> {

  Profile profile = new Profile();
  Settings settings = new Settings();
  Info info = new Info();


  List<Data> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('009.am', textScaleFactor: 1.5),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings, size: 42, color: Colors.black26,),
            tooltip: 'Profile',
            onPressed: () {
              settings.openPageSettings(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, size: 42, color: Colors.white70,),
            tooltip: 'Profile',
            onPressed: () {
              profile.openPageProfile(context);
            },
          ),
        ],

      ),
      body: Container(
        child: ListView(
          children: _buildList(),
        ),
      ),

      persistentFooterButtons: <Widget>[

        IconButton(
          icon: Icon(Icons.settings, size: 40, semanticLabel: 'Настройки', color: Colors.deepOrange),
          onPressed: () {settings.openPageSettings(context);},

        ),

        IconButton(
          icon: Icon(Icons.add_box, size: 40, semanticLabel: 'Info', color: Colors.blue),
          onPressed: () {info.openPageInfo(context);},

        ),
        IconButton(
          icon: Icon(Icons.info_outline, size: 40, semanticLabel: 'Info', color: Colors.green),
          onPressed: () {info.openPageInfo(context);},

        ),
      ],

    );
  }

  _loadData() async {
    final response = await http.get('https://api.coinmarketcap.com/v2/ticker/?limit=100');
    if(response.statusCode == 200) {
//      print(response.body);
      var allData = (json.decode(response.body) as Map)['data'] as Map<String, dynamic>;
      var all_DataList = List<Data>();
      allData.forEach((String key, dynamic val){
        var record = Data(name: val['name'], symbol: val['symbol'], rank: val['rank'], price: val['quotes']['USD']['price']);
        all_DataList.add(record);
      });
      setState(() {
        data = all_DataList;
      });
    }
  }

  List<Widget> _buildList() {
    return data.map((Data f) => ListTile(
      subtitle: Text(f.symbol),
      title: Text(f.name),
      leading: CircleAvatar(child: Text(f.rank.toString()), backgroundColor: Colors.black38,),
      trailing: Text('\$${f.price.toStringAsFixed(2)}'),
    )).toList();
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }
}