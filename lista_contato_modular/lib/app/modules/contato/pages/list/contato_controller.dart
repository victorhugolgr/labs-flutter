import 'package:flutter/foundation.dart';
import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';
import 'package:lista_contato_modular/app/modules/contato/services/interfaces/contato.interface.service.dart';
import 'package:mobx/mobx.dart';

part 'contato_controller.g.dart';

class ContatoController = _ContatoControllerBase with _$ContatoController;

abstract class _ContatoControllerBase with Store {

  final IContatoService contatoService;

  @observable
  ObservableList<ContatoModel> contatos = ObservableList<ContatoModel>();

  @computed
  int get itemsTotal => contatos.length;

  _ContatoControllerBase({@required this.contatoService}) {
    loadList();
  }

  @action
  loadList() async {
    List<ContatoModel> list = await contatoService.queryAllRows();
    contatos.addAll(list);
  }

}
