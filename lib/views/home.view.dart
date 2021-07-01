import 'package:circular_clip_route/circular_clip_route.dart';
import 'package:flutter/material.dart';
import 'package:filter_list/filter_list.dart';
import 'package:sigacred/models/cliente.model.dart';
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
  var repository = OrdemRepository();
  // SimpleAppBarController<String> _controller =
  //     SimpleAppBarController(listFull: ['1', '2']);
  var cliente = ClienteModel(
    id: 1,
    nome: 'Monty',
    email: 'maxie.will@yahoo.com',
    endereco: 'Suite 165 209 Ryan View, Juliannaville, NC 67164',
    fone: '1-812-737-1208',
  );

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
      listData: ['Aberta', 'Fechada', 'Iniciada', 'Pausada'],
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
          if (list.contains('Pausada')) {
            allOrdens.map((e) {
              if (e['paussed'] && !selectedOrdens.contains(e)) {
                selectedOrdens.add(e);
              }
            }).toList();
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
    repository.getAllOrdens().then((value) {
      setState(() {
        allOrdens = value;
      });
    });
    // _controller = SimpleAppBarController(listFull: ['1', '2']);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
            onPressed: () => print(selectedOrdens.length),
            icon: Icon(Icons.ac_unit),
          ),
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
          child: selectedOrdens.isEmpty
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    allOrdens[index]['dateClosed'].toString(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        allOrdens[index]['cliente']['nome']
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        allOrdens[index]['cliente']['fone']
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        allOrdens[index]['cliente']['email']
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
                    )
                  : Center(
                      child: Text("Nenhuma ordem encontrada."),
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                                selectedOrdens[index]['dateClosed'].toString(),
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
                                    selectedOrdens[index]['cliente']['email']
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
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              CircularClipRoute<void>(
                builder: (_) => NewOrdemView(),
                expandFrom: context,
              ));
        },
        icon: Icon(Icons.add),
      ),
    );
  }
}
