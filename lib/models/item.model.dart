class ItemModel {
  int? id;
  String? marca;
  String? problem;
  String? tipoItem;

  ItemModel({this.id, this.marca, this.problem, this.tipoItem});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    marca = json['marca'];
    problem = json['problem'];
    tipoItem = json['tipoItem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['marca'] = this.marca;
    data['problem'] = this.problem;
    data['tipoItem'] = this.tipoItem;
    return data;
  }
}
