import 'package:sigacred/repositories/odem.repository.dart';

class HomeViewModel {
  var repository = OrdemRepository();
  List? listAllOrdens = [];
  Future<List> allOrdens() async {
    return await repository.getAllOrdens();
  }
}
