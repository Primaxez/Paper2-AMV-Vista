import 'package:flutter/material.dart';
import 'package:flutter_application/search/listadoctores.dart';
import '../bloc/doctores_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final doctoresBloc = new DoctoresBloc();

  String opcionPorDefecto = 'Especialidad';

  void dropdownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        opcionPorDefecto = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ListaDoctores());
  }
}
