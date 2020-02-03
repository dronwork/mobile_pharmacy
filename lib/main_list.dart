import 'package:mobile_pharmacy/data_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_pharmacy/ui/profile_screen.dart';

class SystemScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SystemScreenState();
  }
}

class SystemScreenState extends State<SystemScreen> {
  Profile scrn = new Profile();
  List<Data> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('009.am', textScaleFactor: 1.5),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle, size: 42, color: Colors.white70,),
            tooltip: 'Profile',
            onPressed: () {
              scrn.openPage(context);
            },
          ),
        ],
      ),
      body: Container(
        child: ListView(
          children: _buildList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () => _loadData(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            title: Text('Информация'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Настройки'),
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        //onTap: _onItemTapped,
      ),
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