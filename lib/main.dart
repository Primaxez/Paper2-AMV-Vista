import 'package:flutter/material.dart';

import 'bloc/doctores_bloc.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final doctoresBloc = new DoctoresBloc();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: doctoresBloc.doctoresContador,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('Doctores (${ snapshot.data}) ');
            },
          ),
        ),
        
        body: StreamBuilder(
          stream: doctoresBloc.getDoctores,
          builder: (_, AsyncSnapshot<List<String>> snapshot) {  
            
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
                  title:  Text(doctores[i]),
                  trailing: const Icon(Icons.arrow_forward_ios_outlined),
                );
              }, 
              separatorBuilder: (_, __) { 
                return const Divider();
               },
            );
          },
          
        ),
      ),
    );
  }
}