import 'package:flutter/material.dart';
import 'package:flutter_application/models/especialidades.dart';
import 'package:flutter_application/page/detalles_doctor.dart';
import 'package:flutter_application/page/doctores_page.dart';
import 'package:flutter_application/page/home_page.dart';

import 'package:flutter_application/providers/doctores_provider.dart';
import 'package:flutter_application/providers/especialidades_provider.dart';
import 'package:provider/provider.dart';

import 'bloc/doctores_bloc.dart';


void main() => runApp(AppState());

class AppState extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> DoctoresProvider(), lazy: false),
        ChangeNotifierProvider(create: (_)=> EspecialidadesProvider(), lazy: false),
      ],
      child: MyApp(),
      );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: DoctoresPage(),  
        
        );
        
  }
}
