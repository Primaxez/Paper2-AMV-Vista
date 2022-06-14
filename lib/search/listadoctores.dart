import 'package:flutter/material.dart';
import 'package:flutter_application/models/doctores_response.dart';


class ListaDoctores extends StatefulWidget {
  const ListaDoctores({Key? key}) : super(key: key);

  @override
  State<ListaDoctores> createState() => _ListaDoctoresState();
}

class _ListaDoctoresState extends State<ListaDoctores> {
  final items = ['Cardiologia', 'Ginecologia', 'Oftalmologia'];
  String opcionPorDefecto = 'Especialidad';
  String especialidad = 'cardiologia';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Doctores'),
          actions: [DropdownButton(
                      items: items.map((String a ){ 
                return  DropdownMenuItem(
                  value: items,
                  child: Text(a),
                  );}).toList(), 
                  onChanged:(a)=>setState(() {
                    especialidad = 'ginecologia';
                //dropdownCallBack(value);

              }),
                      hint: Text(opcionPorDefecto))],
        ),
        body: FutureBuilder(
            future: DoctorResponse.fetchDoctores('http://10.0.2.2:3000/doctor/get/e/'+especialidad),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return _ListaDoctoresCompleta(snapshot.data);
              }

              ;
            })
      );
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
          return ListTile(leading:  Container(
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1504714146340-959ca07e1f38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1925&q=80'),
                      maxRadius: 30,)
                    ),
                  title:  Text('${doctor.nombre}'),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
            
          );
        });
  }
}