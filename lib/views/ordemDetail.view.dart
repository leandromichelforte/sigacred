import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sigacred/repositories/odem.repository.dart';
import 'package:sigacred/views/home.view.dart';

class OrdemDetailsView extends StatefulWidget {
  OrdemDetailsView({Key? key}) : super(key: key);

  @override
  _OrdemDetailsViewState createState() => _OrdemDetailsViewState();
}

class _OrdemDetailsViewState extends State<OrdemDetailsView> {
  final _formKey = GlobalKey<FormState>();
  OrdemRepository _repository = OrdemRepository();
  List<Map<String, dynamic>> = _history = [
    {
      "id": 6,
      "action": "Fechamento",
      "obs": "Fim da tratativa do problema. Item pronto para devolução ao usuário.",
      "date": DateTime.now(),
    },
    {
      "id": 5,
      "action": "Início",
      "obs": "",
      "date": DateTime.now().subtract(Duration(hours: 2)),
    },
    {
      "id": 4,
      "action": "Parada",
      "obs": "Procura e busca de peça excencial para funcionamento do item",
      "date": DateTime.now().subtract(Duration(days: 2)),
    },
    {
      "id": 3,
      "action": "Início",
      "obs": "Item voltou da garantia de fábria. Retorno da tratativa do problema",
      "date": DateTime.now().subtract(Duration(days: 4)),
    },
    {
      "id": 2,
      "action": "Parada",
      "obs": "Item com defeito de fábrica. Será usada garantia de fábrica. Previsão de retorno em até 5 dias",
      "date": DateTime.now().subtract(Duration(days: 9)),
    },
    {
      "id": 1,
      "action": "Início",
      "obs": "Ordem notada e iniciada a tratativa",
      "date": DateTime.now().subtract(Duration(days: 12)),
    },
  ];
  TextEditingController _actionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // _repository.ordemHistory(ordem['id']); // SEM IMPLEMENTAÇÃO POIS API NÃO RESPONDE
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var ordem = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
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
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(constraints.maxWidth * .02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cliente",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nome: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ordem['cliente']['nome'] ?? " ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "ID: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ordem['cliente']['id'].toString(),
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
                  Row(
                    children: [
                      Text(
                        "Telefone: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ordem['cliente']['fone'] ?? " ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue[900],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Email: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ordem['cliente']['email'] ?? " ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue[900],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Endereço: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ordem['cliente']['endereco'] ?? " ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue[900],
                    ),
                  ),
                  Divider(),
                  Text(
                    "Ordem",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "ID: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ordem['id'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Parada: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ordem['paussed'] ? "Sim" : "Não",
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
                  Text(
                    "Descrição:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ordem['obsOrdem'] ?? "Sem descrição",
                    maxLines: 3,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue[900],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: constraints.maxWidth * .3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Data abertura:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                ordem['dateOrdem'] == null
                                    ? " "
                                    : ordem['dateOrdem'].toString(),
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth * .3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Data início:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                ordem['dateStart'] == null
                                    ? " "
                                    : ordem['dateStart'].toString(),
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth * .3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Data fechamento:",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                ordem['dateClosed'] == null
                                    ? " "
                                    : ordem['dateClosed'].toString(),
                                maxLines: 1,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Text(
                    "Item",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Tipo: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ordem['iten']['tipoItem'].toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "ID: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ordem['iten']['id'].toString(),
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
                  Row(
                    children: [
                      Text(
                        "Marca: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ordem['iten']['marca'] ?? " ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue[900],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Problema:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ordem['iten']['problem'] ?? " ",
                    maxLines: 3,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue[900],
                    ),
                  ),
                  Divider(),
                  Text(
                    "Histórico",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(height: constraints.maxHeight * 0.3, width: constraints.maxWidth, child: ListView.builder(
                      itemCount: _history.length,
                      itemBuilder: (_, index) {
                        return Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _history[index]['obs'] ?? " ",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    _history[index]['action'] ?? " ",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    _history[index]['date'] ?? " ",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          );}),
                  Divider(),
                  ordem['dateClosed'].toString().isEmpty ||
                          ordem['dateClosed'] == null
                      ? Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ação",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              TextFormField(
                                controller: _actionController,
                                validator: (pattern) {
                                  if (pattern != null) if (pattern.isEmpty) {
                                    return 'Não pode ficar vazio';
                                  }
                                },
                                maxLines: 3,
                                cursorColor: Colors.blue[900],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  hintText: "Insira uma descrição da ação",
                                ),
                              ),
                              !_repository.busy
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue[900]),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if ([null, ""]
                                                .contains(ordem['dateStart'])) {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  _repository.busy = true;
                                                });
                                                await _repository
                                                    .startOrdem(ordem['id'])
                                                    .then((_) async {
                                                  setState(() {
                                                    _repository.busy = false;
                                                  });
                                                  await Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute<void>(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              HomeView()),
                                                      (route) => false);
                                                });
                                              }
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "Ordem já iniciada");
                                            }
                                          },
                                          child: Text("Iniciar"),
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue[900]),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (!ordem['paussed']) {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  _repository.busy = true;
                                                });
                                                await _repository
                                                    .pauseOrdem(ordem['id'])
                                                    .then((_) async {
                                                  setState(() {
                                                    _repository.busy = false;
                                                  });
                                                  await Navigator
                                                      .pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute<void>(
                                                        builder: (BuildContext
                                                                context) =>
                                                            HomeView()),
                                                    (route) => false,
                                                  );
                                                });
                                              }
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "Ordem já está parada");
                                            }
                                          },
                                          child: Text("Parar"),
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.blue[900]),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                            ),
                                          ),
                                          onPressed: () async {
                                            setState(() {
                                              _repository.busy = true;
                                            });
                                            if ([
                                              "",
                                              null
                                            ].contains(ordem['dateClosed'])) {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                await _repository
                                                    .closeOrdem(ordem['id'],
                                                        _actionController.text)
                                                    .then((_) async {
                                                  setState(() {
                                                    _repository.busy = false;
                                                  });
                                                  await Navigator
                                                      .pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute<void>(
                                                        builder: (BuildContext
                                                                context) =>
                                                            HomeView()),
                                                    (route) => false,
                                                  );
                                                });
                                              }
                                            } else {
                                              Fluttertoast.showToast(
                                                  msg: "Ordem já está fechada");
                                            }
                                          },
                                          child: Text("Fechar"),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: constraints.maxWidth * .3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                height: 25,
                                                width: 25,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.blue[900],
                                                ),
                                              ),
                                              Text(
                                                " Aguarde...",
                                                style: TextStyle(
                                                    color: Colors.blue[900],
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
