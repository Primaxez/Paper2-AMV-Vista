import 'package:flutter/material.dart';
import 'package:flutter_application/models/especialidades.dart';

class EspecialidadesLista extends StatelessWidget {
  const EspecialidadesLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Doctores '),
        ),
        body: FutureBuilder(
            future: Especialidades.fetchEspecialidades(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                return _ListaEspecialidades(snapshot.data);
              }

              ;
            }));
  }
}

class _ListaEspecialidades extends StatelessWidget {
  final List<Especialidades> especialidades;

  _ListaEspecialidades(this.especialidades);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: especialidades.length,
        itemBuilder: (BuildContext context, int index) {
          final especialidad = especialidades[index];
          return ListTile(
            title: Text('${especialidad.nombre}'),
          );
        });
  }
}
