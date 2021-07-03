import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sigacred/models/cliente.model.dart';
import 'package:sigacred/models/item.model.dart';
import 'package:sigacred/repositories/odem.repository.dart';
import 'package:sigacred/views/home.view.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewOrdemView extends StatefulWidget {
  NewOrdemView({Key? key}) : super(key: key);

  @override
  NewOrdemViewState createState() => NewOrdemViewState();
}

class NewOrdemViewState extends State<NewOrdemView> {
  final _formKey = GlobalKey<FormState>();
  ClienteModel cliente = ClienteModel();
  ItemModel item = ItemModel();
  var _repository = OrdemRepository();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final node = FocusScope.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Salvar",
        backgroundColor: Colors.blue[900],
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            setState(() {
              _repository.busy = true;
            });
            _formKey.currentState!.save();
            await _repository.createOrdem().then((value) async {
              if (value == 201) {
                Fluttertoast.showToast(msg: "Ordem criada com sucesso.");
                await Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => HomeView(),
                  ),
                  (route) => false,
                );
              } else {
                Fluttertoast.showToast(
                    msg: "Erro ao criar ordem. (Código $value)");
              }
              setState(() {
                _repository.busy = false;
              });
            });
          }
        },
        child: _repository.busy
            ? Container(
                height: 25,
                width: 25,
                child: FittedBox(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Icon(Icons.save_rounded),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
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
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.all(constraints.maxWidth * .02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cliente",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      cliente.nome = value;
                      value = "";
                    },
                    validator: (value) {
                      if (value != null) if (value.isEmpty)
                        return "Não pode ficar vazio";
                      return null;
                    },
                    onEditingComplete: () => node.nextFocus(),
                    cursorColor: Colors.blue[900],
                    decoration: InputDecoration(
                      hintText: "Nome",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      cliente.endereco = value;
                      value = "";
                    },
                    validator: (value) {
                      if (value != null) if (value.isEmpty)
                        return "Não pode ficar vazio";
                      return null;
                    },
                    onEditingComplete: () => node.nextFocus(),
                    cursorColor: Colors.blue[900],
                    decoration: InputDecoration(
                      hintText: "Endereço",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onSaved: (value) {
                      cliente.fone = value;
                      value = "";
                    },
                    validator: (value) {
                      if (value != null) if (value.isEmpty)
                        return "Não pode ficar vazio";
                      return null;
                    },
                    onEditingComplete: () => node.nextFocus(),
                    cursorColor: Colors.blue[900],
                    decoration: InputDecoration(
                      hintText: "Telefone",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) {
                      cliente.email = value;
                      value = "";
                    },
                    validator: (value) {
                      if (value != null) if (value.isEmpty)
                        return "Não pode ficar vazio";
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    onEditingComplete: () => node.nextFocus(),
                    cursorColor: Colors.blue[900],
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  Divider(),
                  Text(
                    "Item",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) => item.tipoItem = value,
                    validator: (value) {
                      if (value != null) if (value.isEmpty)
                        return "Não pode ficar vazio";
                      return null;
                    },
                    onEditingComplete: () => node.nextFocus(),
                    cursorColor: Colors.blue[900],
                    decoration: InputDecoration(
                      hintText: "Tipo",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) => item.marca = value,
                    validator: (value) {
                      if (value != null) if (value.isEmpty)
                        return "Não pode ficar vazio";
                      return null;
                    },
                    onEditingComplete: () => node.nextFocus(),
                    cursorColor: Colors.blue[900],
                    decoration: InputDecoration(
                      hintText: "Marca",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    onSaved: (value) => item.problem = value,
                    validator: (value) {
                      if (value != null) if (value.isEmpty)
                        return "Não pode ficar vazio";
                      return null;
                    },
                    onEditingComplete: () => node.nextFocus(),
                    cursorColor: Colors.blue[900],
                    decoration: InputDecoration(
                      hintText: "Problema",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
