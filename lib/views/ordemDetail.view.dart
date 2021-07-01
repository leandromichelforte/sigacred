import 'package:flutter/material.dart';

class OrdemDetailsView extends StatefulWidget {
  OrdemDetailsView({Key? key}) : super(key: key);

  @override
  _OrdemDetailsViewState createState() => _OrdemDetailsViewState();
}

class _OrdemDetailsViewState extends State<OrdemDetailsView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var order = ModalRoute.of(context)?.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
            onPressed: () => print(order['id']),
            icon: Icon(Icons.ac_unit),
          ),
        ],
        centerTitle: true,
        title: Container(
          width: size.width * .3,
          child: FittedBox(
            child: Text(
              "Detalhes",
            ),
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(constraints.maxWidth * .02),
            child: Column(
              children: [
                // TextField(
                //   readOnly: true,
                //   decoration: InputDecoration(
                //     // border: InputBorder.none,
                //     focusedBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(
                //         color: Colors.grey,
                //       ),
                //     ),
                //     errorBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(
                //         color: Colors.red,
                //       ),
                //     ),
                //     contentPadding: EdgeInsets.all(constraints.maxWidth * 0.02),
                //     labelText: "ID",
                //     labelStyle: TextStyle(color: Colors.grey),
                //   ),
                // ),
                // Text("${constraints.maxHeight}\n${constraints.maxWidth}"),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "ID: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      order['id'].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue[900],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
