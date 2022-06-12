import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class DoctoresProvider extends ChangeNotifier {


  DoctoresProvider(){
    print('DoctoresProviders inicializado');
    this.getOnDisplayDoctores();
  }


  getOnDisplayDoctores() async{
      const url = 'http://10.0.2.2:3000/doctor/get/';
      final response = await http.get(Uri.parse(url));
      final decodedData = json.decode(response.body);
      print(decodedData);
     // print(response.data);
  }
  // Await the http get response, then decode the json-formatted response.
  
 

}