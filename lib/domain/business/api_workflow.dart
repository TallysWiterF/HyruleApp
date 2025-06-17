import 'package:hyrule/domain/models/entry.dart';

/// Define o contrato para operações de obtenção de dados de entradas (`Entry`) a partir de uma API externa.
///
/// A interface `ApiWorkflow` abstrai a lógica de comunicação com serviços externos, permitindo buscar
/// entradas filtradas por categoria. Sua utilização facilita a integração do app com fontes de dados remotas,
/// promovendo flexibilidade e desacoplamento entre a lógica de negócio e a camada de acesso à API.
abstract class ApiWorkflow {
  Future<List<Entry>> getEntriesByCategory({required String category});
}
