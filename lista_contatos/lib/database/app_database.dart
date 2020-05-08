import 'package:lista_contatos/dao/contato_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'lista_contatos.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContatoDao.TABLE_SQL);
    },
    version: 1,
  );
}
