import 'package:flutter/material.dart';
import 'package:flutter_application/doctor.dart';
import 'package:flutter_application/models/doctores_response.dart';

class DetallesDoctor extends StatelessWidget {
   
  DoctorResponse doctor;
  DetallesDoctor({Key? key,  required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [_FotoNombre(doctor: doctor),
                
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: AgendarCita, 
                    child: const Text('Solicitar Cita'),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      maximumSize: const Size(double.infinity, 50),
                    )),
                ),
              ]
            )
            )
        ]
      )
    );
  }
}


class _CustomAppBar  extends StatelessWidget{
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

  DoctorResponse doctor;

  _FotoNombre({Key? key,  required this.doctor}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                  placeholder: NetworkImage('https://images.unsplash.com/photo-1588421357574-87938a86fa28?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'), 
                  image: NetworkImage(this.doctor.imagen),
                  height: 150,
            ),
          ),
          SizedBox( width: 20),

          Column(
            
            children: [
              Text(this.doctor.nombre +' '+ this.doctor.apellido, overflow: TextOverflow.ellipsis, maxLines: 2, style: TextStyle(fontSize: 20), textAlign: TextAlign.left,),
              Text(this.doctor.getEspecialidadesdeDoctor(), overflow: TextOverflow.ellipsis, maxLines: 2),
              Text('Calificacion', overflow: TextOverflow.ellipsis, maxLines: 2),

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