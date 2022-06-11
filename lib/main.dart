import 'package:flutter/material.dart';
import 'package:flutter_application/page/home_page.dart';

import 'bloc/doctores_bloc.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage()
    );
  }
}