import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/doctores_response.dart';

class DoctoresProvider extends ChangeNotifier {
  DoctoresProvider() {
    print('DoctoresProviders inicializado');
    this.getOnDisplayDoctores();
  }

  // getOnDisplayDoctores() async {
  //   //const url = 'http://10.0.2.2:3000/doctor/get/';
  //   //final response = await http.get(Uri.parse(url));
  //   print('Hellooo');
  //   //Future ListaDoctores = DoctorResponse.fetchDoctores('Cardiologia');
  //   //final doctorResponse =DoctorResponse.fromMap(response.body);
  //   // List<DoctorResponse> list = parseDoctores(response.body);
  // }

  // Await the http get response, then decode the json-formatted response.

}
