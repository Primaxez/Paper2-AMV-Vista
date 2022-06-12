import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/doctores_response.dart';
class DoctoresProvider extends ChangeNotifier {


  DoctoresProvider(){
    print('DoctoresProviders inicializado');
    this.getOnDisplayDoctores();
  }


  getOnDisplayDoctores() async{
      const url = 'http://10.0.2.2:3000/doctor/get/';
      final response = await http.get(Uri.parse(url));
      final doctorResponse =DoctorResponse.fromMap(response.body);
     
      print(doctorResponse.apellido);
     // print(response.data);
  }
  // Await the http get response, then decode the json-formatted response.
  
 

}