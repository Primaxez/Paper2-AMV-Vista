import 'package:flutter/material.dart';
import 'package:flutter_application/doctor.dart';

import 'bloc/doctores_bloc.dart';
import 'models/doctores_response.dart';

class DoctoresLista extends StatelessWidget {
  final doctoresBloc = new DoctoresBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: doctoresBloc.getDoctores,
      builder: (_, AsyncSnapshot<List<Doctor>> snapshot) {
        final doctores = snapshot.data ?? [];
        return ListView.separated(
          itemCount: doctores.length,
          itemBuilder: (_, i) {
            // ignore: prefer_const_constructors
            return ListTile(
              leading: Container(
                child: CircleAvatar(
                  backgroundImage: MemoryImage(doctores[i].imagen),
                  maxRadius: 30,
                ),
              ),
              title: Text(
                  'Dr. ' + doctores[i].nombre + ' ' + doctores[i].apellido),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            );
          },
          separatorBuilder: (_, __) {
            return const Divider();
          },
        );
      },
    );
  }
}
