import 'package:hyrule/data/dao/database.dart';
import 'package:hyrule/data/dao/entry_dao.dart';
import 'package:hyrule/domain/business/dao_workflow.dart';
import 'package:hyrule/domain/models/entry.dart';

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
