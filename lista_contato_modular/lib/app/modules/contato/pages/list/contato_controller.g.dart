// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContatoController on _ContatoControllerBase, Store {
  Computed<int> _$itemsTotalComputed;

  @override
  int get itemsTotal =>
      (_$itemsTotalComputed ??= Computed<int>(() => super.itemsTotal,
              name: '_ContatoControllerBase.itemsTotal'))
          .value;

  final _$contatosAtom = Atom(name: '_ContatoControllerBase.contatos');

  @override
  ObservableFuture<List<ContatoModel>> get contatos {
    _$contatosAtom.reportRead();
    return super.contatos;
  }

  @override
  set contatos(ObservableFuture<List<ContatoModel>> value) {
    _$contatosAtom.reportWrite(value, super.contatos, () {
      super.contatos = value;
    });
  }

  final _$favoritesAtom = Atom(name: '_ContatoControllerBase.favorites');

  @override
  ObservableFuture<List<ContatoModel>> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(ObservableFuture<List<ContatoModel>> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  final _$_ContatoControllerBaseActionController =
      ActionController(name: '_ContatoControllerBase');

  @override
  dynamic loadList() {
    final _$actionInfo = _$_ContatoControllerBaseActionController.startAction(
        name: '_ContatoControllerBase.loadList');
    try {
      return super.loadList();
    } finally {
      _$_ContatoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fillFavorites() {
    final _$actionInfo = _$_ContatoControllerBaseActionController.startAction(
        name: '_ContatoControllerBase.fillFavorites');
    try {
      return super.fillFavorites();
    } finally {
      _$_ContatoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contatos: ${contatos},
favorites: ${favorites},
itemsTotal: ${itemsTotal}
    ''';
  }
}
