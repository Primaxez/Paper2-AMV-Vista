import 'dart:async';

<<<<<<< Updated upstream
import 'package:flutter_application/doctor.dart';

const DOCTORES = ['Microfono','Parlante', 'Teclado', 'Camara'];
final DOCTORES2 = [Doctor('Carlos', 'Fernandez'), Doctor('Miguel', 'Cuadrado'), Doctor('Alejandro', 'Pestana'),Doctor('Vicente', 'Mirabal')];

class DoctoresBloc {
  
  Stream<List<Doctor>> get getDoctores async* {

    final List<Doctor> doctores = [];

    for (Doctor doctor in DOCTORES2){
=======
const PRODUCTOS = ['Microfono', 'Parlante', 'Teclado', 'Camara'];

class DoctoresBloc {
  Stream<List<String>> get getDoctores async* {
    final List<String> doctores = [];

    for (String doctor in PRODUCTOS) {
>>>>>>> Stashed changes
      await Future.delayed(const Duration(seconds: 2));
      doctores.add(doctor);
      yield doctores;
    }
  }

  StreamController<int> _doctoresContador = new StreamController<int>();

  Stream<int> get doctoresContador => _doctoresContador.stream;

  ProductosBloc() {
    this.getDoctores.listen(
<<<<<<< Updated upstream
      (doctores)=> this._doctoresContador.add(doctores.length)
    );
  }

  dispose(){

    _doctoresContador.close();
  }
}
=======
        (productosList) => this._doctoresContador.add(productosList.length));
  }

  dispose() {
    _doctoresContador.close();
  }
}
>>>>>>> Stashed changes
