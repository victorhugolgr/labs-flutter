import 'package:mobx/mobx.dart';

part 'contato_model_view.g.dart';

class ContatoModelView = _ContatoModelViewBase with _$ContatoModelView;

abstract class _ContatoModelViewBase with Store {
  @observable
  String nome;
  @observable
  String telefone;
  @observable
  String email;
  
  _ContatoModelViewBase({
    this.nome,
    this.telefone,
    this.email,
  });
  

  @action
  setNome(String value)=> nome = value;
  @action
  setTelefone(String value)=> telefone = value;
  @action
  setEmail(String value)=> email = value;

}
