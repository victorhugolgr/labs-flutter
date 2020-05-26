import 'package:flutter/material.dart';

class BottomContentWidget extends StatelessWidget {
  final List<Widget> children;

  const BottomContentWidget({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}