import 'package:flutter/material.dart';

import 'package:lista_contato_modular/app/modules/contato/models/contato_model.dart';

class TopContentWidget extends StatefulWidget {
  final ContatoModel contato;

  TopContentWidget({
    Key key,
    this.contato,
  }) : super(key: key);

  @override
  _TopContentWidgetState createState() => _TopContentWidgetState();
}

class _TopContentWidgetState extends State<TopContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'imagem-${widget.contato.id}',
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/default_user.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: EdgeInsets.all(40.0),
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    widget.contato?.nome,
                    style: TextStyle(color: Colors.white, fontSize: 45.0),
                  ),
                ],
              ),
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
      ),
    );
    ;
  }
}
