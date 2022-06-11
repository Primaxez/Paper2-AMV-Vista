import 'package:flutter/material.dart';
import 'package:flutter_application/doctor.dart';

import 'bloc/doctores_bloc.dart';


class DoctoresLista extends StatelessWidget {
  final doctoresBloc = new DoctoresBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
          stream: doctoresBloc.getDoctores,
          builder: (_, AsyncSnapshot<List<Doctor>> snapshot) {  
            final  doctores= snapshot.data ?? [];
            return  ListView.separated(
              itemCount: doctores.length,
              itemBuilder: ( _ , i){
              // ignore: prefer_const_constructors
                return ListTile(
                  leading:  Container(
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1504714146340-959ca07e1f38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1925&q=80'),
                      maxRadius: 30,)
                    ),
                  title:  Text('Dr. '+doctores[i].nombre +' '+doctores[i].apellido),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                );
              }, 
              separatorBuilder: (_, __) { 
                return const Divider();
               },
            );
          },
          
        );
  }
}