import 'package:flutter/material.dart';

class NewOrdemView extends StatefulWidget {
  NewOrdemView({Key? key}) : super(key: key);

  @override
  NewOrdemViewState createState() => NewOrdemViewState();
}

class NewOrdemViewState extends State<NewOrdemView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
            width: size.width * .3,
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
