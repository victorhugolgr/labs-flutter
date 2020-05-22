// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_model_view.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContatoModelView on _ContatoModelViewBase, Store {
  final _$nomeAtom = Atom(name: '_ContatoModelViewBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$telefoneAtom = Atom(name: '_ContatoModelViewBase.telefone');

  @override
  String get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  final _$emailAtom = Atom(name: '_ContatoModelViewBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$_ContatoModelViewBaseActionController =
      ActionController(name: '_ContatoModelViewBase');

  @override
  dynamic setNome(String value) {
    final _$actionInfo = _$_ContatoModelViewBaseActionController.startAction(
        name: '_ContatoModelViewBase.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_ContatoModelViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTelefone(String value) {
    final _$actionInfo = _$_ContatoModelViewBaseActionController.startAction(
        name: '_ContatoModelViewBase.setTelefone');
    try {
      return super.setTelefone(value);
    } finally {
      _$_ContatoModelViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_ContatoModelViewBaseActionController.startAction(
        name: '_ContatoModelViewBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_ContatoModelViewBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
telefone: ${telefone},
email: ${email}
    ''';
  }
}
