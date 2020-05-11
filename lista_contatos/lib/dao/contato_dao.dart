import 'package:lista_contatos/database/app_database.dart';
import 'package:lista_contatos/models/contato.dart';
import 'package:sqflite/sqlite_api.dart';

class ContatoDao {
  static const String TABLE_SQL = 'CREATE TABLE $_TABLE_NAME('
      '$_id INTEGER PRIMARY KEY, '
      '$_nome TEXT, '
      '$_telefone TEXT,'
      '$_email TEXT) ';

  static const _TABLE_NAME = 'contatos';

  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _telefone = 'telefone';
  static const String _email = 'email';

  Future<int> save(Contato contato) async {
    final Database db = await getDatabase();
    return db.insert(_TABLE_NAME, contato.toMap());
  }

  Future<List<Contato>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_TABLE_NAME);
    return result.isNotEmpty
        ? result.map((item) => Contato.fromMap(item)).toList()
        : [];
  }

  Future<Contato> findOne(int idContato) async {
    final Database db = await getDatabase();
    List<Map> maps =
        await db.query(_TABLE_NAME, where: '$_id = ?', whereArgs: [idContato]);
    if (maps.length > 0) {
      return Contato.fromMap(maps.first);
    }
    return null;
  }

  Future<int> update(Contato contato) async {
    final Database db = await getDatabase();
    return db.update(_TABLE_NAME, contato.toMap(),where: '$_id = ?', whereArgs: [contato.id]);
  }
}
