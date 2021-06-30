import 'package:flutter/material.dart';

class NewOrdem extends StatefulWidget {
  NewOrdem({Key? key}) : super(key: key);

  @override
  NewOrdemState createState() => NewOrdemState();
}

class NewOrdemState extends State<NewOrdem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
            width: size.width * .4,
            child: FittedBox(
              child: Text(
                "Nova Ordem",
              ),
            )),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [Text("")],
        );
      }),
    );
  }
}
