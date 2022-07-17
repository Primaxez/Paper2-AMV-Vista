


import 'package:flutter/material.dart';
import 'package:flutter_application/models/doctor.dart';
import 'package:flutter_application/models/especialidades.dart';

import 'listadoctores.dart';

class DoctorSearchDelegate  extends SearchDelegate{
 

 @override
  
  String? get searchFieldLabel => 'Buscar Doctor';
 
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = '';
      }, 
      icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, null);
      }, 
      icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {


    //GetLista de Doctores Basado en el Query
    

    final DoctoresListExample = [Doctor(id: 3, nombre: 'Vicente', apellido: 'Mirabal', genero: 'M', imagen: 'https://images.unsplash.com/photo-1559035636-a99258c3d0b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', especialidades: [Especialidades(id: 1, nombre: 'Cardiologia')])];
    
    return ListaDoctores(DoctoresListExample);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
      //GetLista de Doctores Basado en el Query
    if(query.isEmpty){
      return Container(
        child: Center(
          child: Icon(Icons.medication, color: Colors.black38, size: 100 ,) ),
      );
    }

    final DoctoresListExample = [Doctor(id: 3, nombre: 'Vicente', apellido: 'Mirabal', genero: 'M', imagen: 'https://images.unsplash.com/photo-1559035636-a99258c3d0b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', especialidades: [Especialidades(id: 1, nombre: 'Cardiologia')])];
    return ListaDoctores(DoctoresListExample);
  }



}