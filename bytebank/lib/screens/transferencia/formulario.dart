import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _TITULO_APP_BAR = 'Criando Transferênca';
const _ROTULO_CAMPO_VALOR = 'Valor';
const _DICA_CAMPO_VALOR =  '0.00';
const _ROTULO_CAMPO_NUMERO_CONTA = 'Número da conta';
const _DICA_CAMPO_NUMERO_CONTA = '0000';
const _TEXTO_BOTAO_CONFIRMAR = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();

  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return _FormularioTransferenciaState();
  }
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_TITULO_APP_BAR)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: widget._controladorCampoNumeroConta,
              rotulo: _ROTULO_CAMPO_VALOR,
              dica: _DICA_CAMPO_VALOR,
            ),
            Editor(
                controlador: widget._controladorCampoValor,
                rotulo: _ROTULO_CAMPO_NUMERO_CONTA,
                dica: _DICA_CAMPO_NUMERO_CONTA,
                icone: Icons.monetization_on),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_TEXTO_BOTAO_CONFIRMAR),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int conta = int.tryParse(widget._controladorCampoNumeroConta.text);
    final double valor = double.tryParse(widget._controladorCampoValor.text);

    if (conta != null && valor != null) {
      final transferencia = Transferencia(valor, conta);
      Navigator.pop(context, transferencia);
    }
  }
}