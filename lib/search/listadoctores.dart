import 'package:flutter/material.dart';
import 'package:flutter_application/models/doctor.dart';
import 'package:flutter_application/models/especialidades.dart';
import 'package:flutter_application/page/detalles_doctor.dart';
import 'package:flutter_application/providers/especialidades_provider.dart';
import 'package:flutter_application/search/search_delegate.dart';
import 'package:provider/provider.dart';

class ListaDoctores extends StatelessWidget {
  final List<Doctor> doctores;

  ListaDoctores(this.doctores);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: doctores.length,
        itemBuilder: (BuildContext context, int index) {
          final doctor = doctores[index];
          String generoDr;
          if (doctor.genero == 'M') {
            generoDr = 'Dr. ';
          } else {
            generoDr = 'Dra. ';
          }
          return ListTile(
            leading: Container(
                child: CircleAvatar(
              backgroundImage: NetworkImage(doctor.imagen),
              maxRadius: 30,
            )),
            title: Text(generoDr + '${doctor.nombre}' + ' ' + '${doctor.apellido}'),
            subtitle:Text(doctor.getEspecialidadesToString()) ,
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap:(){

              final route= MaterialPageRoute(builder: (context)=>  DetallesDoctor(doctor: doctor,) );
              Navigator.push(context, route);


            } ,
          );
        });
  }
}
