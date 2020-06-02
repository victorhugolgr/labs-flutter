import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';
import 'package:lista_contato_modular/app/modules/contato/services/interfaces/contato.interface.service.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

part 'contato_detail_controller.g.dart';

class ContatoDetailController = _ContatoDetailControllerBase
    with _$ContatoDetailController;

abstract class _ContatoDetailControllerBase with Store {
  @observable
  ContatoModel model = ContatoModel();

  final IContatoService contatoService;

  int _id;

  _ContatoDetailControllerBase({@required this.contatoService});

  @action
  load(int id) async {
    this._id = id;
    model = await contatoService.findById(this._id);
  }

  edit() => Modular.link.pushNamed('/edit/$_id');

  delete() async {
    await contatoService.delete(_id);
    Modular.link.pushNamedAndRemoveUntil("/", (route) => false);
  }

  call()=>launch("tel://${model.telefone}");

  sendMail()=> launch("mailto:${model.email}");

  @action
  setFavorite() async {
    model = model.copyWith(favorite: !model.favorite);
    await contatoService.update(model);
  }
}
