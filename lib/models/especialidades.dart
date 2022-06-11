import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Especialidades {
  final int id;
  final String nombre;

  Especialidades({required this.id, required this.nombre});

  List<Object?> get props => [id, nombre];

  static Future<List<Especialidades>> fetchEspecialidades() async {
    const url = 'http://10.0.2.2:3000/especialidad/get/';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<Especialidades> list = parseEspecialidades(response.body);
      return list;
    } else {
      throw Exception('Error al Cargar Especialidades');
    }
  }

  static List<Especialidades> parseEspecialidades(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Especialidades>((json) => Especialidades.fromJson(json))
        .toList();
  }

  factory Especialidades.fromJson(Map<dynamic, dynamic> json) {
    return Especialidades(id: json["id"], nombre: json["nombre"]);
  }
}
