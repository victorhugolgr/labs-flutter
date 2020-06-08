import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/database/init.database.dart';
import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';
import 'package:lista_contato_modular/app/modules/contato/repositories/interfaces/contato.interface.repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class ContatoRepository extends Disposable implements IContatoRepository {
  static final _table = "contato";

  Future<Database> _database() {
    return DatabaseHelper.instance.database;
  }

  // Insere uma linha no banco de dados onde cada chave
  // no Map é um nome de coluna e o valor é o valor da coluna.
  // O valor de retorno é o id da linha inserida.
  Future<int> insert(ContatoModel row) async {
    final Database db = await _database();
    try {
      return await db.insert(_table, row.toMap());
    } catch (error) {
      print(error);
    }
    return null;
  }

  // Todas as linhas são retornadas como uma lista de mapas, onde cada mapa é
  // uma lista de valores-chave de colunas.
  Future<List<ContatoModel>> queryAllRows() async {
    final Database db = await _database();
    try {
      final category = await db.query(_table);

      return List.generate(category.length, (i) {
        return ContatoModel(
          id: category[i]['id'],
          nome: category[i]['nome'],
          telefone: category[i]['telefone'],
          email: category[i]['email'],
          imagemPath: category[i]['imagemPath'],
          favorite: category[i]['favorite'] == 1
        );
      });
    } catch (error) {
      print(error);
    }
    return null;
  }

  // também podem ser feitos usando  comandos SQL brutos.
  // Esse método usa uma consulta bruta para fornecer a contagem de linhas.
  Future<int> queryRowCount() async {
    final Database db = await _database();
    try {
      return Sqflite.firstIntValue(
          await db.rawQuery('SELECT COUNT(*) FROM $_table'));
    } catch (error) {
      print(error);
    }
    return null;
  }

  // Assumimos aqui que a coluna id no mapa está definida. Os outros
  // valores das colunas serão usados para atualizar a linha.
  Future<int> update(ContatoModel row) async {
    final Database db = await _database();
    try {
      return await db
          .update(_table, row.toMap(), where: 'id = ?', whereArgs: [row.id]);
    } catch (error) {
      print(error);
    }
    return null;
  }

  // Exclui a linha especificada pelo id. O número de linhas afetadas é
  // retornada. Isso deve ser igual a 1, contanto que a linha exista.
  Future<int> delete(id) async {
    final Database db = await _database();
    try {
      return await db.delete(_table, where: 'id = ?', whereArgs: [id]);
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<ContatoModel> findById(id) async {
    final Database db = await _database();
    try {
      List<Map<String, dynamic>> maps = await db.query("$_table",
          columns: ["id", "nome", "telefone", "email", "imagemPath", "favorite"],
          where: 'id = ?',
          whereArgs: [id]);

      if (maps.first.length > 0) {
        return ContatoModel.fromMap(maps.first);
      }
    } catch (error) {
      print(error);
    }

    return null;
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<List<ContatoModel>> findAllFavorites() async {
    final Database db = await _database();
    try {
      final category = await db.query(_table, where: "favorite = 1");

      return List.generate(category.length, (i) {
        return ContatoModel(
          id: category[i]['id'],
          nome: category[i]['nome'],
          telefone: category[i]['telefone'],
          email: category[i]['email'],
          imagemPath: category[i]['imagemPath'],
          favorite: category[i]['favorite'] == 1
        );
      });
    } catch (error) {
      print(error);
    }
    return null;
  }
}
