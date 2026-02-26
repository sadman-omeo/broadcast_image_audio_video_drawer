import 'dart:ui';

import 'package:flutter/material.dart';

import 'screens/broadcast_option_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(






        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});









  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  //
  // void _incrementCounter() {
  //   setState(() {
  //     // This call to setState tells the Flutter framework that something has
  //     // changed in this State, which causes it to rerun the build method below
  //     // so that the display can reflect the updated values. If we changed
  //     // _counter without calling setState(), then the build method would not be
  //     // called again, and so nothing would appear to happen.
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
        titleTextStyle: TextStyle(fontSize: 20),
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            //broadcast
            ListTile(
              title: Text("Broadcast"),
              titleTextStyle: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BroadcastOptionScreen(),
                  ),
                );
              }
            ),
            //image scale
            ListTile(title: Text("Image Scale"), titleTextStyle: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold)),
            ListTile(title: Text("Video"), titleTextStyle: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold)),
            ListTile(title: Text("Audio"),titleTextStyle: TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
