import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';
import 'package:lista_contato_modular/app/modules/contato/repositories/interfaces/contato.interface.repository.dart';
import 'package:lista_contato_modular/app/modules/contato/services/interfaces/contato.interface.service.dart';

class ContatoService extends Disposable implements IContatoService {
  final IContatoRepository contatoRepository;
  ContatoService({@required this.contatoRepository});

  Future<List<ContatoModel>> queryAllRows() async {
    return await contatoRepository.queryAllRows();
  }

  Future<int> insert(ContatoModel row) async {
    final id = await contatoRepository.insert(row);
    print('linha inserida id: $id');
    return id;
  }

  Future<ContatoModel> findById(id) async {
    return await contatoRepository.findById(id);
  }

  Future<int> update(ContatoModel row) async {
    final linesChanges = await contatoRepository.update(row);
    print('atualizadas $linesChanges linha(s)');
    return linesChanges;
  }

  Future<int> delete(id) async {
    final lineDelete = await contatoRepository.delete(id);
    print(lineDelete);
    return lineDelete;
  }

  Future<int> queryRowCount() async {
    return await contatoRepository.queryRowCount();
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}