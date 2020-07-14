import 'package:flutter/material.dart';

class SettingModelBottomSheetWidget extends StatelessWidget {
  final Function onTapGaleria;
  final Function onTapCamera;

  const SettingModelBottomSheetWidget({this.onTapGaleria, this.onTapCamera});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.image),
            title: Text('Galeria'),
            onTap: () => onTapGaleria(),
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Câmera'),
            onTap: () => onTapCamera(),
          ),
        ],
      ),
    );
  }
}
