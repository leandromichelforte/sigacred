import 'package:sigacred/models/cliente.model.dart';
import 'package:sigacred/models/item.model.dart';

class OrdemModel {
  String? id;
  ClienteModel? cliente;
  String? dateClosed;
  String? dateOrdem;
  String? dateStart;
  ItemModel? item;
  String? obsOrdem;
  bool? paused;

  OrdemModel(
      {this.id,
      this.cliente,
      this.dateClosed,
      this.dateOrdem,
      this.dateStart,
      this.item,
      this.obsOrdem,
      this.paused});

  OrdemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cliente = json['cliente'];
    dateClosed = json['dateClosed'];
    dateOrdem = json['dateOrdem'];
    dateStart = json['dateStart'];
    item = json['item'];
    obsOrdem = json['obsOrdem'];
    paused = json['paused'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cliente'] = this.cliente;
    data['dateClosed'] = this.dateClosed;
    data['dateOrdem'] = this.dateOrdem;
    data['dateStart'] = this.dateStart;
    data['item'] = this.item;
    data['obsOrdem'] = this.obsOrdem;
    data['paused'] = this.paused;
    return data;
  }
}
