import 'package:flutter/material.dart';
import 'package:lista_contatos/dao/contato_dao.dart';
import 'package:lista_contatos/models/contato.dart';
import 'package:lista_contatos/widget/loading.dart';

class ContatoForm extends StatefulWidget {
  const ContatoForm({Key key}) : super(key: key);

  @override
  _ContatoFormState createState() => _ContatoFormState();
}

class _ContatoFormState extends State<ContatoForm> {
  @override
  Widget build(BuildContext context) {
    final ContatoDao _dao = ContatoDao();

    final Map<String, int> args = ModalRoute.of(context).settings.arguments;

    final int idContato = args != null ? args['id'] : null;

    return Scaffold(
        appBar: AppBar(
          title: Text('Novo contato'),
        ),
        body: FutureBuilder<Contato>(
          future: _getContatoIsExists(_dao, idContato),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Loading();
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                return _Form(snapshot.data);
                break;
            }

            return Text('Unknown error!');
          },
        ));
  }

  Future<Contato> _getContatoIsExists(ContatoDao dao, int idContato) {
    return idContato != null ? dao.findOne(idContato) : Future.value(null);
  }
}

class _Form extends StatefulWidget {
  _Form(this.contato);

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final ContatoDao dao = ContatoDao();
  final Contato contato;

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    if (widget.contato != null) {
      widget._nomeController.text = widget.contato.nome;
      widget._telefoneController.text = widget.contato.telefone;
      widget._emailController.text = widget.contato.email;
    }
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: widget._nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
              style: TextStyle(fontSize: 24.0),
            ),
            TextField(
              controller: widget._telefoneController,
              decoration: InputDecoration(labelText: 'Telefone'),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: widget._emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
              style: TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.emailAddress,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Criar'),
                  onPressed: () {
                    final String name = widget._nomeController.text;
                    final String telefone = widget._telefoneController.text;
                    final String email = widget._emailController.text;

                    if (widget.contato?.id != null) {
                      widget.dao
                          .update(
                              Contato(widget.contato.id, name, telefone, email))
                          .then((id) => Navigator.pop(context));
                    } else {
                      widget.dao
                          .save(Contato(null, name, telefone, email))
                          .then((id) => Navigator.pop(context));
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
