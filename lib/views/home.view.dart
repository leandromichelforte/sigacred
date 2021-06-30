import 'package:circular_clip_route/circular_clip_route.dart';
import 'package:flutter/material.dart';
import 'package:sigacred/models/cliente.model.dart';
import 'package:sigacred/repositories/odem.repository.dart';
import 'package:sigacred/views/newOrdem.view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var repository = OrdemRepository();
    // var cliente = ClienteModel(
    //   id: 1,
    //   nome: 'Monty',
    //   email: 'maxie.will@yahoo.com',
    //   endereco: 'Suite 165 209 Ryan View, Juliannaville, NC 67164',
    //   fone: '1-812-737-1208',
    // );
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return Center(
          child: Text("${size.height}\n${size.width}"),
        );
      }),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              CircularClipRoute<void>(
                builder: (_) => NewOrdem(),
                expandFrom: context,
              ));
        },
        icon: Icon(Icons.add),
      ),
    );
  }
}
