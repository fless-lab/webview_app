import 'dart:async';

import 'package:flutter/material.dart';
import "package:webview_flutter/webview_flutter.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Christ Delices",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final String? _url = "https://christ-delices.herokuapp.com/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Christ Delices"),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_forward)),
        ],
      ),
      body: SafeArea(
        child: WebView(
          initialUrl:
              _url, //ici tu met ton url..mais j'ai préféré utiliser une variable afin de rendre le code plus modularisable
          javascriptMode: JavascriptMode
              .unrestricted, //Ceci c'est pour le fait que normalement les naavigateur on Js mais là non ..
          onWebViewCreated: (WebViewController webviewcontroller) {
            _controller.complete(webviewcontroller);
          },
        ),
      ),
    );
  }
}
