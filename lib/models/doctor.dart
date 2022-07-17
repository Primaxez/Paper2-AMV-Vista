// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);
//import 'dart:js';

import 'package:flutter_application/models/especialidades.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';

class Doctor {
  Doctor(
      {required this.id,
      required this.nombre,
      required this.apellido,
      required this.genero,
      required this.imagen,
      required this.especialidades});

  int id;
  String nombre;
  String apellido;
  String genero;
  String imagen;
  List<Especialidades> especialidades;
  // factory Doctor.fromJson(String str) => Doctor.fromMap(json.decode(str));

  List<Object?> get props => [id, nombre, apellido, genero, imagen];

  static Future<List<Doctor>> fetchDoctores(String especialidad) async {
    final response = await http.get(Uri.parse(especialidad));
    if (response.statusCode == 200) {
      List<Doctor> list = parseDoctores(response.body);
      return list;
    } else {
      throw Exception('Error al Cargar Especialidades');
    }
    //final doctorResponse =Doctor.fromMap(response.body);
  }

  static List<Doctor> parseDoctores(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Doctor>((json) => Doctor.fromJson(json))
        .toList();
  }

  List<Especialidades> listaEspecialidades(List<dynamic> l) {
    List<Especialidades> result = List.empty();
    for (var item in l) {
      result = (Especialidades.parseEspecialidades(item));
    }
    return result;
  }

  factory Doctor.fromJson(Map<dynamic, dynamic> json) {
    return Doctor(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        genero: json["genero"],
        imagen: json["imagen"],
        especialidades:
            Especialidades.parseEspecialidadesLista(json["especialidades"]));
  }

  String getEspecialidadesToString(){

    String especialidades='';
    
    for(var i in this.especialidades){
      especialidades = especialidades + i.nombre+ ', ';
    }
    final pos = especialidades.length - 2;
    final resultado =  especialidades.substring(0,pos) + '.';
    
    return resultado;


  }


List<Especialidades> getespecialidades(){
  return this.especialidades;
}

}


