import 'package:flutter/material.dart';
import 'package:lista_contatos/models/contato.dart';

class ContatoDetail extends StatelessWidget {
  const ContatoDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Contato contato =
        Contato(1, 'Batman', '(91) 3255-4460', 'victor@hugo.com');

    return Scaffold(
      body: Column(
        children: <Widget>[
          _topContent(contato, context),
          _buttonContent(contato, context),
          _bottomContent(contato, context),
        ],
      ),
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
          contato.nome,
          style: TextStyle(color: Colors.white, fontSize: 45.0),
        ),
      ],
    );

    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/batman_profile.png"),
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
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    color: Colors.blue,
                  ),
                  Text(
                    'Favorito',
                    style: TextStyle(color: Colors.blue, fontSize: 12.0),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.phone,
                    color: Colors.blue,
                  ),
                  Text(
                    'Ligar',
                    style: TextStyle(color: Colors.blue, fontSize: 12.0),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    color: Colors.blue,
                  ),
                  Text(
                    'Editar',
                    style: TextStyle(color: Colors.blue, fontSize: 12.0),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.delete,
                    color: Colors.blue,
                  ),
                  Text(
                    'Excluir',
                    style: TextStyle(color: Colors.blue, fontSize: 12.0),
                  )
                ],
              )
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
          Row(
            children: <Widget>[
              Icon(Icons.phone, color: Colors.grey[700], ),
              SizedBox(width: 16.0,),
              Text(
                contato.telefone,
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          )
        ],
      ),
    );
  }
}
