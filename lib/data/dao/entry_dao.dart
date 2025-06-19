import 'package:floor/floor.dart';
import 'package:hyrule/domain/models/entry.dart';

/// Responsável por definir as operações de acesso ao banco de dados local para a entidade `Entry`.
///
/// A classe `EntryDao` utiliza o padrão DAO (Data Access Object) para abstrair e centralizar as
/// operações de consulta, inserção e remoção de registros de entradas no banco de dados SQLite.
/// Sua utilização permite que o app manipule dados persistidos de forma eficiente e desacoplada
/// da lógica de negócio, facilitando manutenção, testes e evolução da camada de persistência.
@dao
abstract class EntryDao {
  @Query('SELECT * FROM ENTRY')
  Future<List<Entry>> getAllEntries();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addEntry(Entry entry);

  @delete
  Future<void> removeEntry(Entry entry);
}
