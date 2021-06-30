import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sigacred/models/ordem.model.dart';

class OrdemRepository {
  var dio = Dio();
  Future<List> allOrdens() async {
    List response = [];
    await dio
        .get('https://desafio.sigacred.com.br/v1/ordens')
        .then((allOrdens) {
      allOrdens.statusCode == 200
          ? response = allOrdens.data
          : Fluttertoast.showToast(
              msg: "Erro(${allOrdens.statusCode}) ao buscar ordens.");
    });
    return response;
  }

  Future<void> createOrdem() async {
    await dio.post(
      'https://desafio.sigacred.com.br/v1/ordens/create',
      data: {
        "dateOrdem": "2021-06-30T04:22:56.609Z",
        "idClient": 1,
        "idItem": 1
      },
    );
  }
}
