import 'package:flutter/material.dart';

class InfoAttrContentWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  const InfoAttrContentWidget({Key key, this.icon, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
            child: Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.grey[700],
                ),
                SizedBox(
                  width: 16.0,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
            onTap: onTap,
          );
  }
}