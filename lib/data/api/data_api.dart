import 'package:dio/dio.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:hyrule/utils/consts/api.dart';

/// Responsável por realizar a comunicação com a API externa para obtenção de dados de entradas (`Entry`).
///
/// A classe `DataApi` centraliza as requisições HTTP, permitindo buscar e converter dados remotos
/// em objetos do domínio do app. Sua utilização facilita a integração com serviços externos,
/// abstraindo detalhes de rede e promovendo desacoplamento entre a lógica de negócio e a camada de acesso à API.
class DataApi {
  final Dio dio = Dio();

  List<Entry> entries = [];
  Future<List<Entry>> getEntriesByCategory({required String category}) async {
    final response = await dio.get(urlCategory + category);

    entries = List<Entry>.from((response.data['data']).map(
      (e) => Entry.fromMap(e),
    ));

    return entries;
  }
}
