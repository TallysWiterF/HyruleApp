import 'package:hyrule/data/api/data_api.dart';
import 'package:hyrule/domain/business/api_workflow.dart';
import 'package:hyrule/domain/models/entry.dart';

/// Responsável por implementar o fluxo de obtenção de dados remotos no app.
///
/// A classe `ApiController` atua como intermediária entre a lógica de negócio e a camada de acesso à API,
/// utilizando o `DataApi` para buscar entradas (`Entry`) filtradas por categoria em serviços externos.
/// Sua utilização garante o desacoplamento da lógica de comunicação com APIs, facilitando manutenção,
/// testes e evolução da integração com fontes de dados remotas no aplicativo.
class ApiController implements ApiWorkflow {
  final DataApi dataApi = DataApi();

  @override
  Future<List<Entry>> getEntriesByCategory({required String category}) =>
      dataApi.getEntriesByCategory(category: category);
}
