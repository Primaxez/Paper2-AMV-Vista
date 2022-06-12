import 'package:flutter/material.dart';
import 'package:flutter_application/screens/especialidades_lista.dart';
import 'package:flutter_application/search/listadoctores.dart';
import 'package:flutter_application/search/search_delegate.dart';

import '../bloc/doctores_bloc.dart';
import '../doctor_lis.dart';

class HomePage extends StatelessWidget {
  final doctoresBloc = new DoctoresBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Doctores'),
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: DoctorSearchDelegate()),
                icon: Icon(Icons.search_outlined))
          ],
        ),
        //body: ListaDoctores());
        body: ListaDoctores()
     );
         //body: EspecialidadesLista());
  }
}

