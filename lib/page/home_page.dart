import 'package:flutter/material.dart';
import 'package:flutter_application/screens/especialidades_lista.dart';
import 'package:flutter_application/search/listadoctores.dart';
import 'package:flutter_application/search/search_delegate.dart';

import '../bloc/doctores_bloc.dart';
import '../doctor_lis.dart';
import '../screens/listview2_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final doctoresBloc = new DoctoresBloc();

  final items = ['Cardiologia', 'Ginecologia', 'Oftalmologia'];

  String opcionPorDefecto = 'Especialidad';

  void dropdownCallBack(String? selectedValue){
    if (selectedValue is String){
      setState(() {
        opcionPorDefecto = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
        // appBar: AppBar(
        //   title: const Text('Doctores'),
        //   actions: [
        //     // IconButton(
        //     //     onPressed: () => showSearch(
        //     //         context: context, delegate: DoctorSearchDelegate()),
        //     //     icon: Icon(Icons.search_outlined)),
        //     Center(child: DropdownButton(
              
        //       items: items.map((String a ){ 
        //         return  DropdownMenuItem(
        //           value: items,
        //           child: Text(a),
        //           );}).toList(),
        //       onChanged: (value)=>setState(() {
        //         opcionPorDefecto = 'NuevoEstado';
        //         //dropdownCallBack(value);

        //       }),
        //       hint: Text(opcionPorDefecto),)
        //       ) 
        //   ],
        // ),
        //body: ListaDoctores());
        body: ListaDoctores()
     );
         //body: EspecialidadesLista());
  }
}

