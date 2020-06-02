// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContatoDetailController on _ContatoDetailControllerBase, Store {
  final _$modelAtom = Atom(name: '_ContatoDetailControllerBase.model');

  @override
  ContatoModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(ContatoModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_ContatoDetailControllerBase.load');

  @override
  Future load(int id) {
    return _$loadAsyncAction.run(() => super.load(id));
  }

  final _$setFavoriteAsyncAction =
      AsyncAction('_ContatoDetailControllerBase.setFavorite');

  @override
  Future setFavorite() {
    return _$setFavoriteAsyncAction.run(() => super.setFavorite());
  }

  @override
  String toString() {
    return '''
model: ${model}
    ''';
  }
}
