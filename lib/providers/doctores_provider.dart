


import 'package:flutter/material.dart';

class DoctoresProvider extends ChangeNotifier {

  DoctoresProvider(){
    print('DoctoresProviders inicializado');
    this.getOnDisplayDoctores();
  }


  getOnDisplayDoctores() async{
    print('geOnDisplayDoctores');
  }

}