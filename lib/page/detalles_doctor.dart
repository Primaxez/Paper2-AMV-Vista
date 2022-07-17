import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../models/doctor.dart';
import '../models/especialidades.dart';
import '../providers/citas_provider.dart';
import '../search/listadoctores.dart';
import 'resultado_solicitud_cita.dart';

class DetallesDoctor extends StatelessWidget {
   
  Doctor doctor;
  DetallesDoctor({Key? key,  required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [_FotoNombre(doctor: doctor),
              ChangeNotifierProvider(
                create: ( _ ) => SolicitudCitaProvider(),
                child: _SolicitarCitaForm(doctor: doctor),
                ),                              
              ]
            )
          )
        ]
      )
    );
  }
}


class CustomAppBar  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('MyOnlineDoctor'),
        background: FadeInImage(
          placeholder: NetworkImage('https://images.unsplash.com/photo-1588421357574-87938a86fa28?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'), 
          image: NetworkImage('https://images.unsplash.com/photo-1588421357574-87938a86fa28?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _FotoNombre extends StatelessWidget {

  Doctor doctor;
  _FotoNombre({Key? key,  required this.doctor}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    String generoDr;
          if (doctor.genero == 'M') {
            generoDr = 'Dr. ';
          } else {
            generoDr = 'Dra. ';
          }
    return Container(

      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
           mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                  placeholder: NetworkImage('https://images.unsplash.com/photo-1588421357574-87938a86fa28?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'), 
                  image: NetworkImage(this.doctor.imagen),
                  //height: 210,
                  width: 250,
            ),
          ),
          SizedBox( width: 20),

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(generoDr+' '+this.doctor.nombre +' '+ this.doctor.apellido, overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,) ),
              SizedBox(height: 10),
              //Text('Especialidad: ', style: TextStyle(fontSize: 15), textAlign: TextAlign.left),
              Text(this.doctor.getEspecialidadesToString(), overflow: TextOverflow.ellipsis, maxLines: 2),
              SizedBox(height: 20),
              Text('Calificacion Promedio', overflow: TextOverflow.ellipsis, maxLines: 2),

            ],
          )
        ],
      ),
    );
  }
}


void AgendarCita(){

  print('Cita Agendada');
}

class _SolicitarCitaForm extends StatefulWidget {

  Doctor doctor;
  _SolicitarCitaForm({ Key? key, required this.doctor }) : super(key: key);

  @override
  State<_SolicitarCitaForm> createState() => _SolicitarCitaFormState();
}

class _SolicitarCitaFormState extends State<_SolicitarCitaForm> {

    
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

