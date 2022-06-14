// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);
//import 'dart:js';

import 'package:flutter_application/models/especialidades.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_application/doctor.dart';

class DoctorResponse {
  DoctorResponse(
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
  dynamic imagen;
  List<Especialidades> especialidades;
  // factory DoctorResponse.fromJson(String str) => DoctorResponse.fromMap(json.decode(str));

  List<Object?> get props => [id, nombre, apellido, genero, imagen];

  static Future<List<DoctorResponse>> fetchDoctores(String especialidad) async {
    String url =  especialidad;
    final response = await http.get(Uri.parse(especialidad));
    if (response.statusCode == 200) {
      List<DoctorResponse> list = parseDoctores(response.body);
      return list;
    } else {
      throw Exception('Error al Cargar Especialidades');
    }
    //final doctorResponse =DoctorResponse.fromMap(response.body);
  }

  static List<DoctorResponse> parseDoctores(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<DoctorResponse>((json) => DoctorResponse.fromJson(json))
        .toList();
  }

  List<Especialidades> listaEspecialidades(List<dynamic> l) {
    List<Especialidades> result = List.empty();
    for (var item in l) {
      result = (Especialidades.parseEspecialidades(item));
    }
    return result;
  }

  factory DoctorResponse.fromJson(Map<dynamic, dynamic> json) {
    return DoctorResponse(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        genero: json["genero"],
        imagen: json['imagen'],
        especialidades:
            Especialidades.parseEspecialidadesLista(json["especialidades"]));
  }
}
