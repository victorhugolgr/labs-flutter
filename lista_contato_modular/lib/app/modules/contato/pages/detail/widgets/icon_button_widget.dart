import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTap;

  const IconButtonWidget({Key key, this.text, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).textTheme.title.color,
          ),
          Text(
            text,
            style: TextStyle(color: Theme.of(context).textTheme.title.color, fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
