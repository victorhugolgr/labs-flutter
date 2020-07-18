// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoriteController on _FavoriteControllerBase, Store {
  Computed<int> _$itemsTotalComputed;

  @override
  int get itemsTotal =>
      (_$itemsTotalComputed ??= Computed<int>(() => super.itemsTotal,
              name: '_FavoriteControllerBase.itemsTotal'))
          .value;

  final _$contatosAtom = Atom(name: '_FavoriteControllerBase.contatos');

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

  final _$_FavoriteControllerBaseActionController =
      ActionController(name: '_FavoriteControllerBase');

  @override
  dynamic loadList() {
    final _$actionInfo = _$_FavoriteControllerBaseActionController.startAction(
        name: '_FavoriteControllerBase.loadList');
    try {
      return super.loadList();
    } finally {
      _$_FavoriteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contatos: ${contatos},
itemsTotal: ${itemsTotal}
    ''';
  }
}
