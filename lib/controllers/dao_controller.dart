import 'package:hyrule/data/dao/database.dart';
import 'package:hyrule/data/dao/entry_dao.dart';
import 'package:hyrule/domain/business/dao_workflow.dart';
import 'package:hyrule/domain/models/entry.dart';

/// Responsável por implementar o fluxo de persistência de dados locais no app.
///
/// A classe `DaoController` atua como ponte entre a lógica de negócio e o banco de dados local,
/// utilizando o DAO para realizar operações de consulta, inserção e remoção de entradas (`Entry`).
/// Sua utilização garante o desacoplamento da lógica de acesso a dados, facilitando manutenção,
/// testes e evolução da camada de persistência no aplicativo.
class DaoController implements DaoWorkflow {
  Future<EntryDao> createDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    return database.entryDao;
  }

  @override
  Future<List<Entry>> getAllEntries() =>
      createDatabase().then((entryDao) => entryDao.getAllEntries());

  @override
  Future<void> saveEntry({required Entry entry}) async =>
      createDatabase().then((entryDao) => entryDao.saveEntry(entry));

  @override
  Future<void> deleteEntry({required Entry entry}) async =>
      createDatabase().then((entryDao) => entryDao.deleteEntry(entry));
}
