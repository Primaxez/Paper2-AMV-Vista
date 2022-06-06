import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
   
final options = const ['Roger', 'Rafa', 'Nole', 'Carlitos', 'Nico', 'Sascha','Roger', 'Rafa', 'Nole', 'Carlitos', 'Nico', 'Sascha','Roger', 'Rafa', 'Nole', 'Carlitos', 'Nico', 'Sascha','Roger', 'Rafa', 'Nole', 'Carlitos', 'Nico', 'Sascha'];

  const Listview2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Doctores '),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder:(context,index)=> ListTile(
          leading: const Icon(Icons.person_outline_rounded), 
          title: Text(options[index]), 
          //subtitle: Text(options[index]),
          trailing: const Icon(Icons.arrow_forward_ios_outlined)
        ), 
        separatorBuilder: (_,__)=> const Divider(), 
        
      )
    );
  }
}