class ClienteModel {
  int? id;
  String? email;
  String? endereco;
  String? fone;
  String? nome;

  ClienteModel({this.id, this.email, this.endereco, this.fone, this.nome});

  ClienteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    endereco = json['endereco'];
    fone = json['fone'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['endereco'] = this.endereco;
    data['fone'] = this.fone;
    data['nome'] = this.nome;
    return data;
  }
}
