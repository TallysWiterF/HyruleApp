import 'package:floor/floor.dart';
import 'package:hyrule/domain/models/entry.dart';

@dao
abstract class EntryDao {
  @Query('SELECT * FROM ENTRY')
  Future<List<Entry>> getAllEntries();

  @Query('SELECT * FROM ENTRY WHERE id = :id')
  Future<Entry?> getEntryById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveEntry(Entry entry);

  @delete
  Future<void> deleteEntry(Entry entry);
}
