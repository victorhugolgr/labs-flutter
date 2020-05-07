import 'package:lista_contatos/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'lista_contatos.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contatos('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'telefone TEXT,'
          'email TEXT) ');
    },
    version: 1,
  );
}

Future<int> save(Contato contato) async {
  final Database db = await getDatabase();

  final Map<String, dynamic> contactMap = Map();
  contactMap['nome'] = contato.nome;
  contactMap['telefone'] = contato.telefone;
  contactMap['email'] = contato.email;

  return db.insert('contatos', contactMap);
}

Future<List<Contato>> findAll() async {
  final Database db = await getDatabase();

  final List<Map<String, dynamic>> result = await db.query('contatos');

  final List<Contato> contatos = List();

  for (Map<String, dynamic> row in result) {
    final Contato contato = Contato(
      row['id'],
      row['nome'],
      row['telefone'],
      row['email'],
    );
    contatos.add(contato);
  }
  return contatos;
}
