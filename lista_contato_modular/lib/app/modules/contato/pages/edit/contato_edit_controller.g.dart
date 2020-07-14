// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContatoEditController on _ContatoEditControllerBase, Store {
  Computed<String> _$urlImageComputed;

  @override
  String get urlImage =>
      (_$urlImageComputed ??= Computed<String>(() => super.urlImage,
              name: '_ContatoEditControllerBase.urlImage'))
          .value;
  Computed<File> _$imageComputed;

  @override
  File get image => (_$imageComputed ??= Computed<File>(() => super.image,
          name: '_ContatoEditControllerBase.image'))
      .value;
  Computed<dynamic> _$sizeImageComputed;

  @override
  dynamic get sizeImage =>
      (_$sizeImageComputed ??= Computed<dynamic>(() => super.sizeImage,
              name: '_ContatoEditControllerBase.sizeImage'))
          .value;

  final _$contatoModelAtom =
      Atom(name: '_ContatoEditControllerBase.contatoModel');

  @override
  ContatoModel get contatoModel {
    _$contatoModelAtom.reportRead();
    return super.contatoModel;
  }

  @override
  set contatoModel(ContatoModel value) {
    _$contatoModelAtom.reportWrite(value, super.contatoModel, () {
      super.contatoModel = value;
    });
  }

  final _$validateAtom = Atom(name: '_ContatoEditControllerBase.validate');

  @override
  bool get validate {
    _$validateAtom.reportRead();
    return super.validate;
  }

  @override
  set validate(bool value) {
    _$validateAtom.reportWrite(value, super.validate, () {
      super.validate = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_ContatoEditControllerBase.load');

  @override
  Future load(int id) {
    return _$loadAsyncAction.run(() => super.load(id));
  }

  final _$salvarAsyncAction = AsyncAction('_ContatoEditControllerBase.salvar');

  @override
  Future salvar() {
    return _$salvarAsyncAction.run(() => super.salvar());
  }

  final _$takePictureAsyncAction =
      AsyncAction('_ContatoEditControllerBase.takePicture');

  @override
  Future takePicture(ImageSource sourse) {
    return _$takePictureAsyncAction.run(() => super.takePicture(sourse));
  }

  @override
  String toString() {
    return '''
contatoModel: ${contatoModel},
validate: ${validate},
urlImage: ${urlImage},
image: ${image},
sizeImage: ${sizeImage}
    ''';
  }
}
