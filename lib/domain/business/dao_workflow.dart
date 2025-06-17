import 'package:hyrule/domain/models/entry.dart';

/// Define o contrato para operações de acesso e manipulação de dados de entradas (`Entry`) no app.
///
/// A interface `DaoWorkflow` abstrai as operações essenciais de persistência, como buscar, salvar
/// e remover registros de entradas. Sua utilização permite que diferentes implementações de acesso
/// a dados sejam integradas ao aplicativo sem alterar a lógica de negócio, promovendo flexibilidade,
/// testabilidade e desacoplamento entre as camadas do sistema.
abstract class DaoWorkflow {
  Future<List<Entry>> getAllEntries();

  Future<void> saveEntry({required Entry entry});

  Future<void> deleteEntry({required Entry entry});
}
