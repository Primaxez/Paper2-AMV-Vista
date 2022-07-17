
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/doctor.dart';
import '../models/especialidades.dart';
import '../page/detalles_doctor.dart';
import '../page/resultado_solicitud_cita.dart';
import '../providers/citas_provider.dart';
import '../search/listadoctores.dart';






class SolicitarCitaForm extends StatefulWidget {

  Doctor doctor;
  SolicitarCitaForm({ Key? key, required this.doctor }) : super(key: key);

  @override
  State<SolicitarCitaForm> createState() => SolicitarCitaFormState();
}

class SolicitarCitaFormState extends State<SolicitarCitaForm> {

    
    String opcionporDefecto = 'Especialidad';
    String? especialidad = '';
 
  @override
  Widget build(BuildContext context) {
    final citaForm = Provider.of<SolicitudCitaProvider>(context);
    citaForm.doctor = this.widget.doctor;
    final items = this.widget.doctor.getespecialidades();
   // opcionporDefecto = items[0].nombre;
    return Container(
      margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: citaForm.formKey,
        child: Column(
          children: [
            DropdownButton<Especialidades>(
                items: items
                    .map<DropdownMenuItem<Especialidades>>((Especialidades a) {
                  return DropdownMenuItem<Especialidades>(
                    value: a,
                    child: Text(a.nombre),
                  );
                }).toList(),
                onChanged: (Especialidades? a) => setState(() {
                       citaForm.especialidad =a;                      
                       especialidad = a?.nombre;
                       opcionporDefecto = especialidad!;
                       print(opcionporDefecto);
                    }),
                hint: Text(opcionporDefecto)
               ),
               ElevatedButton(
                    onPressed: citaForm.isloading ? null : () async{
                      if(citaForm.esSolicitudValida()){
                          citaForm.isloading = true;
                          //VALIDAR SI LA SOLICITUD DE LA CITA ES VALIDA
                          String result = 'CITA SOLICITADA';
                          final route= MaterialPageRoute(builder: (context)=>  ResultadoSolicitudCita(resultado: result,) );
                          await Future.delayed(Duration(seconds: 2));                                                 
                          citaForm.isloading = false;
                          Navigator.push(context, route);
                          
                      }
                      AgendarCita;
                    }, 
                    child:  Text(citaForm.isloading ? 'Espere': 'Solicitar Cita'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      maximumSize: const Size(double.infinity, 50),
                    )
               ),
          ],
        ),
      ),
    );
  }
}