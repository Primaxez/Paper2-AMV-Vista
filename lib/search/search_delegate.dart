// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application/doctor_lis.dart';

import '../bloc/doctores_bloc.dart';

class DoctorSearchDelegate extends SearchDelegate{
  
 @override
  String get searchFieldLabel => 'Buscar doctor';
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
     IconButton(
      onPressed: ()=> query = '', 
      icon: Icon(Icons.clear))];
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
    if(query.isEmpty){
      return Container(
        child: Center(
          child: Icon(Icons.list_sharp, color: Colors.black38, size: 100),
      )
      );
    }

    return DoctoresLista();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   
    if(query.isEmpty){
      return Container(
        child: Center(
          child: Icon(Icons.list_sharp, color: Colors.black38, size: 100),
      )
      );
    }

    return DoctoresLista();

  }


}