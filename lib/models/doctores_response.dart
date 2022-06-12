// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

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

    factory DoctorResponse.fromJson(String str) => DoctorResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DoctorResponse.fromMap(Map<String, dynamic> json) =>DoctorResponse(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        genero: json["genero"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "genero": genero,
        "imagen": imagen,
    };
}







