import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OrdemRepository {
  var dio = Dio();
  Future<List> getAllOrdens() async {
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
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
      data: {
        "dateOrdem": "2021-06-30T04:22:56.609Z",
        "idClient": 1,
        "idItem": 1
      },
    ).then((value) => print(value.data));
  }

  Future<void> testPost() async {
    await dio.post(
      'https://gorest.co.in/public-api/users',
      options: Options(
        headers: {"Content-Type": "application/json"},
      ),
      data: {
        // "id": 1,
        "name": "Leandro",
        "email": "lm@gmail.com",
        "gender": "Male",
        "status": "Active",
        "created_at": "2021-07-01T03:50:03.383+05:30",
        "updated_at": "2021-07-01T03:50:03.383+05:30"
      },
    ).then((value) => print(value.data));
  }
}
