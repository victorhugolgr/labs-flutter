import 'package:flutter/material.dart';
import 'package:lista_contatos/dao/contato_dao.dart';
import 'package:lista_contatos/models/contato.dart';
import 'package:lista_contatos/widget/confirm_dialog.dart';
import 'package:lista_contatos/widget/loading.dart';
import 'package:url_launcher/url_launcher.dart';

class ContatoDetail extends StatefulWidget {
  const ContatoDetail({Key key}) : super(key: key);

  @override
  _ContatoDetailState createState() => _ContatoDetailState();
}

class _ContatoDetailState extends State<ContatoDetail> {
  @override
  Widget build(BuildContext context) {
    final ContatoDao _dao = ContatoDao();

    final Map<String, int> args = ModalRoute.of(context).settings.arguments;

    final int idContato = args != null ? args['id'] : null;

    if (idContato == null) Navigator.popAndPushNamed(context, '/list');

    return FutureBuilder(
      future: _dao.findOne(idContato),
      builder: (context, snapshot) {
        if (snapshot?.data != null) {
          final Contato contato = snapshot?.data;
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Loading();
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              return Scaffold(
                body: Column(
                  children: <Widget>[
                    _topContent(contato, context),
                    _buttonContent(contato, context),
                    _bottomContent(contato, context),
                  ],
                ),
              );
              break;
          }
        }

        return Text("Algum erro aconteceu");
      },
    );
  }

  /**
   * 
   */
  Widget _topContent(Contato contato, BuildContext context) {
    final topContentText = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          contato?.nome,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
      ],
    );

    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/batman_profile.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _buttonContent(Contato contato, BuildContext context) {
    final ContatoDao _dao = ContatoDao();
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _iconButton('Favoritar', Icons.favorite, () {}, context),
              _iconButton(
                  "Editar",
                  Icons.edit,
                  () => Navigator.pushNamed(context, '/edit',
                      arguments: {'id': contato.id}),
                  context),
              _iconButton('Excluir', Icons.delete, () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return ConfirmDialog(
                        texto: 'Deseja excluir o contato ${contato.nome}?',
                        sim: () async {
                          final idDeletado = await _dao.delete(contato.id);
                          debugPrint(idDeletado.toString());
                          Navigator.of(context).pushReplacementNamed('/list');
                          dispose();
                        },
                        nao: () => Navigator.of(context).pop(),
                      );
                    });
              }, context),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  /**
   * 
   */
  Widget _bottomContent(Contato contato, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.grey[700],
                ),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  contato.telefone,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            onTap: () => launch("tel://${contato.telefone}"),
          ),
          SizedBox(
            height: 16.0,
          ),
          InkWell(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.grey[700],
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    contato.email,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              onTap: () => launch("mailto:${contato.email}"))
        ],
      ),
    );
  }

  Widget _iconButton(
      String texto, IconData icone, Function acao, BuildContext context) {
    return GestureDetector(
      onTap: () => acao(),
      child: Column(
        children: <Widget>[
          Icon(
            icone,
            color: Colors.blue,
          ),
          Text(
            texto,
            style: TextStyle(color: Colors.blue, fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
