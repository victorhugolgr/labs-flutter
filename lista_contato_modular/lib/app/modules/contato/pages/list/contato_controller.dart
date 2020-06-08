import 'package:flutter/foundation.dart';
import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';
import 'package:lista_contato_modular/app/modules/contato/services/interfaces/contato.interface.service.dart';
import 'package:mobx/mobx.dart';

part 'contato_controller.g.dart';

class ContatoController = _ContatoControllerBase with _$ContatoController;

abstract class _ContatoControllerBase with Store {
  final IContatoService contatoService;

  @observable
  ObservableFuture<List<ContatoModel>> contatos;

  @observable
  ObservableFuture<List<ContatoModel>> favorites;

  @computed
  int get itemsTotal => contatos.value.length;

  _ContatoControllerBase({@required this.contatoService}) {
    loadList();
    fillFavorites();
  }

  @action
  loadList() {
    contatos = contatoService.queryAllRows().asObservable();
  }

  @action
  fillFavorites() {
    favorites = contatoService.findAllFavorites().asObservable();
  }
}
