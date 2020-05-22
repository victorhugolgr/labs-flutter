import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/model_views/contato_model_view.dart';
import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';
import 'package:lista_contato_modular/app/modules/contato/services/interfaces/contato.interface.service.dart';
import 'package:mobx/mobx.dart';

part 'contato_edit_controller.g.dart';

class ContatoEditController = _ContatoEditControllerBase
    with _$ContatoEditController;

abstract class _ContatoEditControllerBase extends Disposable with Store {
  final IContatoService contatoService;

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  int _id;

  @observable
  ContatoModelView modelView = new ContatoModelView();

  _ContatoEditControllerBase({@required this.contatoService});

  load(int id) async {
    this._id = id;
    ContatoModel contato = await contatoService.findById(_id);
    nomeController.text = contato.nome;
    telefoneController.text = contato.telefone;
    emailController.text = contato.email;
  }

  salvar() async {
    ContatoModel contato = ContatoModel(
      id: _id,
      nome: modelView.nome,
      telefone: modelView.telefone,
      email: modelView.email,
    );
    if(this._id == null){
      await this._insert(contato);
    }else {
      await this._update(contato);
    }
    Modular.link.pushNamedAndRemoveUntil("/", (route) => false);
  }

  _insert(ContatoModel contato) async {
    await this.contatoService.insert(contato);
  }

  _update(ContatoModel contato) async {
    await this.contatoService.update(contato);
  }

  @override
  void dispose() {}
}
