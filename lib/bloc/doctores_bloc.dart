import 'dart:async';

import 'package:flutter_application/models/especialidades.dart';
import 'package:flutter_application/models/models.dart';

import '../models/doctor.dart';


const DOCTORES = ['Microfono','Parlante', 'Teclado', 'Camara'];
final DOCTORES2 = [Doctor(id: 1, nombre: 'Alejandro', apellido: 'Pestana', genero: 'M', imagen: '', especialidades: [Especialidades(id: 1, nombre: 'Cardiologia')])];
//Future ListaDoctores = DoctorResponse.fetchDoctores();
class DoctoresBloc {
  
  Stream<List<Doctor>> get getDoctores async* {

    final List<Doctor> doctores = [];

    for (Doctor doctor in DOCTORES2){
      await Future.delayed(const Duration(seconds: 2));
      doctores.add(doctor);
      yield doctores;
    }
  }

  StreamController<int> _doctoresContador = new StreamController<int>();

  Stream<int> get doctoresContador => _doctoresContador.stream;

  ProductosBloc() {
    this.getDoctores.listen(

      (doctores)=> this._doctoresContador.add(doctores.length)
    );
  }

  dispose(){

    _doctoresContador.close();
  }
}
