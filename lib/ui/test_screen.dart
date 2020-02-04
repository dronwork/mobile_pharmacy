import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:mobile_pharmacy/main.dart';

class Test extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (_) => new WebviewScaffold(
          url: "https://009.рф",
          debuggingEnabled: false,
          enableAppScheme: false,
          withJavascript: true,

          appBar: new AppBar(
            backgroundColor: Colors.green,
            title: new Text("Информация"),
            ),
        ),
      },
    debugShowCheckedModeBanner: false,

    );


  }

}