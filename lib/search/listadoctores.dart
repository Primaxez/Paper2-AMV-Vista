import 'package:flutter/material.dart';
import 'package:flutter_application/models/doctores_response.dart';
import 'package:flutter_application/models/especialidades.dart';

class ListaDoctores extends StatefulWidget {
  const ListaDoctores({Key? key}) : super(key: key);

  @override
  State<ListaDoctores> createState() => _ListaDoctoresState();
}

class _ListaDoctoresState extends State<ListaDoctores> {
  //final items = ['Cardiologia', 'Ginecologia', 'Oftalmologia'];
  final items = [Especialidades(id: 0, nombre: '...'),Especialidades(id: 1, nombre: 'Cardiologia'),Especialidades(id: 2, nombre: 'Ginecologia'), Especialidades(id: 3, nombre: 'Oftalmologia') ];
 //final items= Especialidades.fetchEspecialidades();
  String opcionPorDefecto = 'Especialidad';
  String? especialidad = '';
  String? e = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Doctores'),
          actions: [DropdownButton<Especialidades>(
                    items: items.map<DropdownMenuItem<Especialidades>>((Especialidades a ){ 
                          return  DropdownMenuItem<Especialidades>(
                            value: a,
                            child: Text(a.nombre),
                            );}).toList(), 
                    onChanged:(Especialidades? a)=>setState(() {
                                        if(a?.nombre =='...'){
                                            especialidad ='';
                                            e = '';
                                             opcionPorDefecto = 'Especialidad';
                                        }else{
                                            e = 'e/';
                                            especialidad =  a?.nombre;
                                            opcionPorDefecto = especialidad!;
                                        }
                                                  
                                        
                //dropdownCallBack(value);
                                }),
                    hint: Text(opcionPorDefecto))],
        ),
        body: FutureBuilder(
            future: DoctorResponse.fetchDoctores('http://10.0.2.2:3000/doctor/get/'+e!+especialidad!),
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
          return ListTile(
            leading: Container(
                child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1504714146340-959ca07e1f38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1925&q=80'),
              maxRadius: 30,
            )),
            title: Text('${doctor.nombre}'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          );
        });
  }
}
