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
  ObservableList<ContatoModel> get contatos {
    _$contatosAtom.reportRead();
    return super.contatos;
  }

  @override
  set contatos(ObservableList<ContatoModel> value) {
    _$contatosAtom.reportWrite(value, super.contatos, () {
      super.contatos = value;
    });
  }

  final _$_initAsyncAction = AsyncAction('_ContatoControllerBase._init');

  @override
  Future _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  @override
  String toString() {
    return '''
contatos: ${contatos},
itemsTotal: ${itemsTotal}
    ''';
  }
}
