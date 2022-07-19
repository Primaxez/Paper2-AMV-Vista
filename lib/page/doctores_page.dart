import 'package:flutter/material.dart';
import 'package:flutter_application/models/doctor.dart';
import 'package:flutter_application/models/especialidades.dart';
import 'package:flutter_application/page/detalles_doctor.dart';
import 'package:flutter_application/providers/especialidades_provider.dart';
import 'package:flutter_application/search/search_delegate.dart';
import 'package:provider/provider.dart';

import '../search/listadoctores.dart';

class DoctoresPage extends StatefulWidget {
  const DoctoresPage({Key? key}) : super(key: key);

  @override
  State<DoctoresPage> createState() => _DoctoresPage();
}

class _DoctoresPage extends State<DoctoresPage> {
  String opcionPorDefecto = 'Especialidad';
  String? especialidad = '';
  String? e = '';
  @override
  Widget build(BuildContext context) {
    final especialidadesProvider = Provider.of<EspecialidadesProvider>(context);
    final items = especialidadesProvider.especialidadesDisponibles;
    return Scaffold(
        appBar: AppBar(
          title: Text('Doctores'),
          actions: [
            
            DropdownButton<Especialidades>(
                items: items
                    .map<DropdownMenuItem<Especialidades>>((Especialidades a) {
                  return DropdownMenuItem<Especialidades>(
                    value: a,
                    child: Text(a.nombre),
                  );
                }).toList(),
                onChanged: (Especialidades? a) => setState(() {
                      if (a?.nombre == '...') {
                        especialidad = '';
                        e = '';
                        opcionPorDefecto = 'Especialidad';
                      } else {
                        e = 'e/';
                        especialidad = a?.nombre;
                        opcionPorDefecto = especialidad!;
                      }
                    }),
                hint: Text(opcionPorDefecto)
                ),
             IconButton(
              onPressed: ()=> showSearch(context: context, delegate: DoctorSearchDelegate()), 
              icon: Icon(Icons.search_outlined)
              ),

          ],
        ),
        body: FutureBuilder(
            future: Doctor.fetchDoctores(
                'http://10.0.2.2:3000/doctor/get/' + e! + especialidad!),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ListaDoctores(snapshot.data);
              }

              ;
            }));
  }
}