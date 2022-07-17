import 'package:flutter/material.dart';
import 'package:flutter_application/models/doctores_response.dart';
import 'package:flutter_application/models/especialidades.dart';


class SolicitudCitaProvider extends ChangeNotifier {

  GlobalKey<FormState>  formKey = new GlobalKey<FormState>();

  DoctorResponse? doctor;
  Especialidades? especialidad;
  int pacienteID =0;
  


  bool _isloading = false;

  bool get isloading => _isloading;

  set isloading (bool value){
    _isloading = value;
    notifyListeners();
  }

  bool esSolicitudValida(){

    print(this.doctor!.nombre);
    print(formKey.currentState?.validate() ?? false);

    return formKey.currentState?.validate() ?? false;

  }



}