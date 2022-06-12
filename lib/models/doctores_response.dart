// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_application/doctor.dart';

class DoctorResponse {

    DoctorResponse({
        required this.id,
        required this.nombre,
        required this.apellido,
        required this.genero,
        required this.imagen,
    });

    int id;
    String nombre;
    String apellido;
    String genero;
    dynamic imagen;

   // factory DoctorResponse.fromJson(String str) => DoctorResponse.fromMap(json.decode(str));

      List<Object?> get props => [id, nombre, apellido, genero, imagen];

    static Future<List<DoctorResponse>> fetchDoctores() async{
      const url = 'http://10.0.2.2:3000/doctor/get/';
      final response = await http.get(Uri.parse(url));
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

  factory DoctorResponse.fromJson(Map<dynamic, dynamic> json) {
    return DoctorResponse(id: json["id"], nombre: json["nombre"], apellido: json["apellido"],genero: json["genero"], imagen: json['genero']);
  }
}







