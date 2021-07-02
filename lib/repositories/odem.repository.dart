import 'package:dio/dio.dart';

class OrdemRepository {
  var dio = Dio();
  bool busy = false;
  Future<List> getAllOrdens() async {
    List response = [];
    await dio
        .get('https://desafio.sigacred.com.br/v1/ordens')
        .then((allOrdens) {
      if (allOrdens.statusCode == 200) response = allOrdens.data;
    });
    return response;
  }

  Future<int?> createOrdem() async {
    int? _statusCode = 0;
    await dio.post(
      'https://desafio.sigacred.com.br/v1/ordens/create',
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
      data: {
        "dateOrdem": DateTime.now().toString(),
        "idClient": 2,
        "idItem": 20
      },
    ).then((value) {
      _statusCode = value.statusCode;
    });
    return _statusCode;
  }

  Future<void> startOrdem(int id) async {
    await dio.post(
      'https://desafio.sigacred.com.br/v1/ordens/startOrdem',
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
      data: {"datestart": DateTime.now().toString(), "id": id},
    );
  }

  Future<void> closeOrdem(int? id, String? obs) async {
    await dio.post(
      'https://desafio.sigacred.com.br/v1/ordens/closeOrdem',
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
      data: {
        "id": id,
        "obsOrdem": obs,
      },
    );
  }

  Future<void> pauseOrdem(int id) async {
    await dio.post(
      'https://desafio.sigacred.com.br/v1/ordens/pauseOrdem',
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
      data: {
        "id": id,
        "motion": "string",
      },
    );
  }

  Future<List> ordemHistory(int id) async {
    List _history = [];
    await dio
        .get(
      'https://desafio.sigacred.com.br/v1/ordens/pauseOrdem/$id',
    )
        .then((value) {
      if (value.statusCode == 200) _history = value.data;
    });
    return _history;
  }

  void test() {
    busy = true;
    Future.delayed(Duration(seconds: 3), () {
      busy = false;
    });
  }
}
