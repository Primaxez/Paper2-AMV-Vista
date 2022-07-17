import 'package:flutter/material.dart';
import 'package:flutter_application/models/especialidades.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/doctor.dart';

class DoctoresProvider extends ChangeNotifier {
  DoctoresProvider() {
    print('DoctoresProviders inicializado');
    this.getOnDisplayDoctores();
  }

  getOnDisplayDoctores() async {
    //const url = 'http://10.0.2.2:3000/doctor/get/';
    //final response = await http.get(Uri.parse(url));
    print('Hellooo');
    Future ListaDoctores =
        Doctor.fetchDoctores('http://10.0.2.2:3000/doctor/get/');
    Future ListaEpecialidades = Especialidades.fetchEspecialidades();
    print(ListaEpecialidades);
    //final doctorResponse =Doctor.fromMap(response.body);
    // List<Doctor> list = parseDoctores(response.body);
  }

  // Await the http get response, then decode the json-formatted response.

}
