import 'package:flutter_application/models/especialidades.dart';
import 'package:flutter/material.dart';

class EspecialidadesFiltro {
  final int id;
  final Especialidades especialidad;
  final bool value;
  final List<EspecialidadesFiltro> especialidades = List.empty();

  EspecialidadesFiltro({
    required this.id,
    required this.especialidad,
    required this.value,
  });

  EspecialidadesFiltro copyWith({
    int? id,
    Especialidades? especialidades,
    bool? value,
  }) {
    return EspecialidadesFiltro(
        id: id ?? this.id,
        especialidad: especialidad,
        value: value ?? this.value);
  }

  List<Object?> get props => [id, especialidad, value];

  Future<List<EspecialidadesFiltro>> getFilters() async {
    var items = Especialidades.fetchEspecialidades();

    return especialidades;
  }
}
