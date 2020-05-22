import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';
import 'package:lista_contato_modular/app/modules/contato/model_views/contato_model_view.dart';
import 'package:lista_contato_modular/app/modules/contato/services/interfaces/contato.interface.service.dart';
import 'package:mobx/mobx.dart';

part 'contato_edit_controller.g.dart';

class ContatoEditController = _ContatoEditControllerBase
    with _$ContatoEditController;

abstract class _ContatoEditControllerBase extends Disposable with Store {
  final IContatoService contatoService;

  @observable
  ContatoModelView modelView = new ContatoModelView();

  _ContatoEditControllerBase({@required this.contatoService});

  salvar() async {
    await this._insert(ContatoModel(
      nome: modelView.nome,
      telefone: modelView.telefone,
      email: modelView.email,
    ));
    Modular.link.pushNamedAndRemoveUntil("/", (route)=> false);
  }

  _insert(ContatoModel contato) async {
    return await this.contatoService.insert(contato);
  }

  @override
  void dispose() {
    
  }
}
