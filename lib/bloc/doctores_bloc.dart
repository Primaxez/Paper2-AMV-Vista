import 'dart:async';

const PRODUCTOS = ['Microfono','Parlante', 'Teclado', 'Camara'];

class DoctoresBloc {
  
  Stream<List<String>> get getDoctores async* {

    final List<String> doctores = [];

    for (String doctor in PRODUCTOS){
      await Future.delayed(const Duration(seconds: 2));
      doctores.add(doctor);
      yield doctores;
    }
  }

  StreamController<int> _doctoresContador = new StreamController<int>();

  Stream<int> get doctoresContador => _doctoresContador.stream;

  ProductosBloc(){
    this.getDoctores.listen(
      (productosList)=> this._doctoresContador.add(productosList.length)
      );
  }


  dispose(){

    _doctoresContador.close();
  }



}