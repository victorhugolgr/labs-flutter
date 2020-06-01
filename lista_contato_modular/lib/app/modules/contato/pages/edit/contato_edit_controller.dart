import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  final GlobalKey<FormState> key = new GlobalKey();

  @observable
  bool validate = false;

  int _id;

  _ContatoEditControllerBase({@required this.contatoService});

  load(int id) async {
    this._id = id;
    ContatoModel contato = await contatoService.findById(_id);
    nomeController.text = contato.nome;
    telefoneController.text = contato.telefone;
    emailController.text = contato.email;
  }

  @action
  salvar() async {
    if (!key.currentState.validate()) {
      validate = true;
    } else {
      ContatoModel contato = ContatoModel(
        id: _id,
        nome: nomeController.text,
        telefone: telefoneController.text,
        email: emailController.text,
      );
      if (this._id == null) {
        await this._insert(contato);
      } else {
        await this._update(contato);
      }
      key.currentState.save();
      Modular.link.pushNamedAndRemoveUntil("/", (route) => false);
    }
  }

  _insert(ContatoModel contato) async {
    await this.contatoService.insert(contato);
  }

  _update(ContatoModel contato) async {
    await this.contatoService.update(contato);
  }

  String validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o nome";
    } else if (!regExp.hasMatch(value)) {
      return "O nome deve conter caracteres de a-z ou A-Z";
    }
    return null;
  }

  String validarCelular(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Informe o celular";
    } else if(value.length != 10){
      return "O celular deve ter 10 dígitos";
    }else if (!regExp.hasMatch(value)) {
      return "O número do celular so deve conter dígitos";
    }
    return null;
  }

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Informe o Email";
    } else if (!regExp.hasMatch(value)) {
      return "Email inválido";
    } else {
      return null;
    }
  }

  @override
  void dispose() {}
}
