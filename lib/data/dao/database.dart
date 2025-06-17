import 'dart:async';
import 'package:floor/floor.dart';
import 'package:hyrule/data/dao/entry_dao.dart';
import 'package:hyrule/domain/models/entry.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

/// Responsável por gerenciar a configuração e o acesso ao banco de dados local do app.
///
/// A classe `AppDatabase` define a estrutura do banco de dados SQLite utilizando o Floor,
/// especificando as entidades e os DAOs disponíveis. Sua utilização centraliza a criação,
/// abertura e versionamento do banco, permitindo que o app realize operações de persistência
/// de dados de forma eficiente, segura e desacoplada da lógica de negócio.
@Database(version: 1, entities: [Entry])
abstract class AppDatabase extends FloorDatabase {
  EntryDao get entryDao;
}
