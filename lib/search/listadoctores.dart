import 'package:flutter/material.dart';
import 'package:flutter_application/models/doctores_response.dart';
import 'package:flutter_application/models/especialidades.dart';
import 'package:flutter_application/page/detalles_doctor.dart';
import 'package:flutter_application/providers/especialidades_provider.dart';
import 'package:provider/provider.dart';

class ListaDoctores extends StatefulWidget {
  const ListaDoctores({Key? key}) : super(key: key);

  @override
  State<ListaDoctores> createState() => _ListaDoctoresState();
}

class _ListaDoctoresState extends State<ListaDoctores> {
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
                hint: Text(opcionPorDefecto))
          ],
        ),
        body: FutureBuilder(
            future: DoctorResponse.fetchDoctores(
                'http://10.0.2.2:3000/doctor/get/' + e! + especialidad!),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return _ListaDoctoresCompleta(snapshot.data);
              }

              ;
            }));
  }
}

class _ListaDoctoresCompleta extends StatelessWidget {
  final List<DoctorResponse> doctores;

  _ListaDoctoresCompleta(this.doctores);
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
            subtitle:Text(doctor.getEspecialidadesdeDoctor()) ,
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap:(){

              final route= MaterialPageRoute(builder: (context)=> DetallesDoctor(doctor: doctor) );
              Navigator.push(context, route);


            } ,
          );
        });
  }
}
