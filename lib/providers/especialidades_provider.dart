

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/especialidades.dart';

class EspecialidadesProvider extends ChangeNotifier{
  
  List<Especialidades> especialidadesDisponibles = [Especialidades(id: 0, nombre: '...')];

  EspecialidadesProvider(){
    print('EspecialidadesProvider inicializado');
    this.getOnDisplayEspecialidades();
  }

  getOnDisplayEspecialidades() async{
    print('getOnDisplayEspecialidades');

    const url = 'http://10.0.2.2:3000/especialidad/get/';
    final response = await http.get(Uri.parse(url));
    final especialidades = Especialidades.parseEspecialidades(response.body);
    print(especialidades);
    this.especialidadesDisponibles.addAll(especialidades);
    notifyListeners();
    
  }


}