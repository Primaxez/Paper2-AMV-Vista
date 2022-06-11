import 'package:flutter/material.dart';
import 'package:flutter_application/models/especialidades.dart';
import 'package:flutter_application/page/home_page.dart';
<<<<<<< Updated upstream
import 'package:flutter_application/providers/doctores_provider.dart';
import 'package:provider/provider.dart';

import 'bloc/doctores_bloc.dart';


void main() => runApp(AppState());
=======
import 'bloc/doctores_bloc.dart';

void main() => runApp(MyApp());
>>>>>>> Stashed changes


class AppState extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> DoctoresProvider(), lazy: false),
      ],
      child: MyApp(),
      );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: HomePage());
  }
}
