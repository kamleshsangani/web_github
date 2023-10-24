import 'dart:html';

import 'package:flutter/material.dart';
import 'package:js/js_util.dart';
import 'js_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Web App'),
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

  String _profileInfo = "";

  void _closeScreen() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    setProperty(window, 'setProfileInfo', allowInterop(setProfileInfo));
  }

  void setProfileInfo(String profileInfo) {
    setState(() {
      _profileInfo = profileInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 18,),
            ElevatedButton(
              onPressed: () {
                sendToastMessage();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade400,
              ),
              child: const Text(
                'Get User Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 18,),
            Text(
              _profileInfo,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _closeScreen,
        tooltip: 'Close Screen',
        child: const Icon(Icons.clear),
      ),
    );
  }
}
