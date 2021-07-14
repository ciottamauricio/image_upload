import 'dart:io';
import 'package:flutter/material.dart';

import 'image_item_controller.dart';

class ImageItemWidget extends StatefulWidget {
  final String titulo;
  const ImageItemWidget({Key key, this.titulo}) : super(key: key);

  @override
  _ImageItemWidgetState createState() => _ImageItemWidgetState();
}

class _ImageItemWidgetState extends State<ImageItemWidget> {
  File _image;
  final controller = ImageItemController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: _image != null
          ? BoxDecoration(
              image: DecorationImage(
                image: FileImage(File(_image.path)),
                fit: BoxFit.cover,
              ),
            )
          : BoxDecoration(color: Colors.grey),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          color: Colors.black.withOpacity(0.3),
          child: ListTile(
            title: Text(widget.titulo),
            trailing: IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.grey[800],
              ),
              onPressed: () {
                _showPicker(context);
              },
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Escolher foto'),
                      onTap: () async {
                        File image = await controller.obterImagemGaleria();
                        setState(() {
                          if (image != null) _image = image;
                        });

                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Tirar foto'),
                    onTap: () async {
                      File image = await controller.obterImagemCamera();
                      setState(() {
                        if (image != null) _image = image;
                      });

                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                      leading: Icon(Icons.delete),
                      title: Text('Apagar foto'),
                      onTap: () async {
                        setState(() {
                          _image = null;
                        });

                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }
}
