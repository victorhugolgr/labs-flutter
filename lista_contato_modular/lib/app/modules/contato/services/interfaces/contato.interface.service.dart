import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';

abstract class IContatoService {
  Future<int> insert(ContatoModel row);
  Future<List<ContatoModel>> queryAllRows();
  Future<int> queryRowCount();
  Future<int> update(ContatoModel row);
  Future<int> delete(id);
  Future<ContatoModel> findById(id);
  Future<List<ContatoModel>> findAllFavorites();
}
