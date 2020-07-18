import 'package:flutter/widgets.dart';
import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';
import 'package:lista_contato_modular/app/modules/contato/services/interfaces/contato.interface.service.dart';
import 'package:mobx/mobx.dart';

part 'favorite_controller.g.dart';

class FavoriteController = _FavoriteControllerBase with _$FavoriteController;

abstract class _FavoriteControllerBase with Store {
  final IContatoService contatoService;

  @observable
  ObservableFuture<List<ContatoModel>> contatos;

  @computed
  int get itemsTotal => contatos.value.length;

  _FavoriteControllerBase({@required this.contatoService}) {
    loadList();
  }

  @action
  loadList() {
    contatos = contatoService.findAllFavorites().asObservable();
  }
}
