import 'package:circular_clip_route/circular_clip_route.dart';
import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sigacred/models/constants.model.dart';
import 'package:sigacred/repositories/odem.repository.dart';
import 'package:sigacred/views/newOrdem.view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List allOrdens = [];
  List selectedOrdens = [];
  var _repository = OrdemRepository();

  void _openFilterDialog() async {
    await FilterListDialog.display<String>(
      context,
      hideheader: true,
      allButtonText: "Todas",
      resetButtonText: "Limpar",
      applyButtonText: "Filtrar",
      selectedItemsText: "status selecionado(s)",
      applyButonTextBackgroundColor: Colors.blue[900]!,
      applyButtonTextStyle: TextStyle(color: Colors.white),
      listData: ['Aberta', 'Fechada', 'Iniciada', 'Parada'],
      selectedListData: [],
      height: 300,
      choiceChipLabel: (item) {
        return item;
      },
      validateSelectedItem: (list, val) {
        return list!.contains(val);
      },
      onItemSearch: (list, text) {
        if (list!.any(
          (element) => element.toLowerCase().contains(
                text.toLowerCase(),
              ),
        )) {
          return list
              .where((element) =>
                  element.toLowerCase().contains(text.toLowerCase()))
              .toList();
        } else {
          return [];
        }
      },
      onApplyButtonClick: (list) {
        if (list != null) {
          selectedOrdens.clear();
          if (list.isNotEmpty) {
            if (list.contains('Aberta')) {
              allOrdens.map((e) {
                if (e['dateClosed'] == null && !selectedOrdens.contains(e)) {
                  selectedOrdens.add(e);
                }
              }).toList();
            }
            if (list.contains('Fechada')) {
              allOrdens.map((e) {
                if (e['dateClosed'] != null && !selectedOrdens.contains(e)) {
                  selectedOrdens.add(e);
                }
              }).toList();
            }
            if (list.contains('Iniciada')) {
              allOrdens.map((e) {
                if (e['dateStart'] != null && !selectedOrdens.contains(e)) {
                  selectedOrdens.add(e);
                }
              }).toList();
            }
            if (list.contains('Parada')) {
              allOrdens.map((e) {
                if (e['paussed'] && !selectedOrdens.contains(e)) {
                  selectedOrdens.add(e);
                }
              }).toList();
            }
            if (list.isEmpty || list.length == 4) {
              allOrdens.map((e) {
                if (e['paussed'] && !selectedOrdens.contains(e)) {
                  selectedOrdens.add(e);
                }
              }).toList();
            }
          }
          setState(() {});
        }
        Navigator.pop(context);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _repository.busy = true;
    });
    _repository.getAllOrdens().then((value) {
      if (value.isNotEmpty) {
        setState(() {
          allOrdens = value;
        });
      } else {
        Fluttertoast.showToast(msg: "Falha ao buscar as ordens");
      }
      setState(() {
        _repository.busy = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
            onPressed: () => _openFilterDialog(),
            icon: Icon(Icons.filter_alt_rounded),
          ),
        ],
        centerTitle: true,
        title: Container(
          width: size.width * .3,
          child: FittedBox(
            child: Text(
              "Ordens",
            ),
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          color: Colors.grey[300],
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: _repository.busy
              ? Center(
                  child: Container(
                    width: constraints.maxWidth * .5,
                    child: FittedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Carregando...  ",
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : selectedOrdens.isEmpty
                  ? allOrdens.isNotEmpty
                      ? ListView.builder(
                          itemCount: allOrdens.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.ordemDetailsView,
                                  arguments: allOrdens[index],
                                );
                              },
                              child: Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${allOrdens[index]['id']}. ${allOrdens[index]['iten']['problem']}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        allOrdens[index]['obsOrdem'] == null
                                            ? "Sem observação"
                                            : allOrdens[index]['obsOrdem']
                                                .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        allOrdens[index]['dateOrdem']
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Container(
                                        width: constraints.maxWidth,
                                        child: FittedBox(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width:
                                                    constraints.maxWidth * .3,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    FittedBox(
                                                      child: Text(
                                                        allOrdens[index]
                                                                    ['cliente']
                                                                ['nome']
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    constraints.maxWidth * .3,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    FittedBox(
                                                      child: Text(
                                                        allOrdens[index]
                                                                    ['cliente']
                                                                ['fone']
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    constraints.maxWidth * .3,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    FittedBox(
                                                      child: Text(
                                                        allOrdens[index]
                                                                    ['cliente']
                                                                ['email']
                                                            .toString(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            "Nenhuma ordem encontrada :(",
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        )
                  : ListView.builder(
                      itemCount: selectedOrdens.length,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.ordemDetailsView,
                              arguments: selectedOrdens[index],
                            );
                          },
                          child: Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${selectedOrdens[index]['id']}. ${selectedOrdens[index]['iten']['problem']}",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    selectedOrdens[index]['obsOrdem'] == null
                                        ? "Sem observação"
                                        : selectedOrdens[index]['obsOrdem']
                                            .toString(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    selectedOrdens[index]['dateClosed']
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        selectedOrdens[index]['cliente']['nome']
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        selectedOrdens[index]['cliente']['fone']
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        selectedOrdens[index]['cliente']
                                                ['email']
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Navigator.push(
              context,
              CircularClipRoute<void>(
                builder: (_) => NewOrdemView(),
                expandFrom: context,
              ));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
