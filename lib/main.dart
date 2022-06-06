import 'package:flutter/material.dart';

import 'package:flutter_application/screens/listview2_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Listview2Screen()
    );
  }
}