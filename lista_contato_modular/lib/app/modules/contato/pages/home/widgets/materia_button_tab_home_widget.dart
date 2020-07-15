import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MaterialButtonTabHomeWidget extends StatefulWidget {
  final Function onPressed;
  final String title;
  final int currentTab;
  final IconData icon;
  final int indexTab;

  const MaterialButtonTabHomeWidget(
      {Key key,
      this.onPressed,
      this.title,
      this.currentTab,
      this.icon,
      this.indexTab})
      : super(key: key);

  @override
  _MaterialButtonTabHomeWidgetState createState() =>
      _MaterialButtonTabHomeWidgetState();
}

class _MaterialButtonTabHomeWidgetState
    extends State<MaterialButtonTabHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return MaterialButton(
        minWidth: 40,
        onPressed: widget.onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              widget.icon,
              color: widget.currentTab == widget.indexTab
                  ? Theme.of(context).accentColor
                  : Colors.grey,
            ),
            Text(
              widget.title,
              style: TextStyle(
                color: widget.currentTab == widget.indexTab
                    ? Theme.of(context).accentColor
                    : Colors.grey,
              ),
            ),
          ],
        ),
      );
    });
  }
}
