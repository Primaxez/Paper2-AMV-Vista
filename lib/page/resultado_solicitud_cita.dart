import 'package:flutter/material.dart';
import 'package:flutter_application/search/listadoctores.dart';

import 'detalles_doctor.dart';
import 'doctores_page.dart';

class ResultadoSolicitudCita extends StatelessWidget {
  ResultadoSolicitudCita({ Key? key, required this.resultado }) : super(key: key);
  
  
  String resultado;
  @override
  Widget build(BuildContext context) {
    dynamic color = Color.fromARGB(255, 5, 190, 100);
    dynamic icon=Icons.check_circle_outline;
    String mensaje = '';
    if (resultado != 'CITA SOLICITADA'){
      color = Color.fromARGB(255, 226, 8, 59);
      icon = Icons.cancel_sharp;
      mensaje = 'No se pudo solicitar su cita';

    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [

                Container(
                  margin: EdgeInsets.only(top: 80),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                  child: Column(

                    //crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [Icon( icon ,color:color, size: 70 ,),
                        Text(resultado, style: TextStyle(fontSize: 35, color:color),),
                        ],
                      ),
                     Text(mensaje, style: TextStyle(fontSize: 20, color:color),),
                    SizedBox(height: 120,),
                    ElevatedButton(
                      onPressed:  () {                                    
                        final route= MaterialPageRoute(builder: (context)=>  DoctoresPage() );                 
                          //VALIDAR SI LA SOLICITUD DE LA CITA ES VALIDA                   
                          Navigator.push(context, route);
                      },  
                      child:  Text('Regresar'),
                      style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      maximumSize: const Size(double.infinity, 50),
                    )),              

                  ]),
                )
                
              ]
            )
            )
        ]
      )
    )
    );
  }
}


