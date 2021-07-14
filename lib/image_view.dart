import 'package:flutter/material.dart';

import 'image_item_widget.dart';

class ImageView extends StatefulWidget {
  const ImageView({Key key}) : super(key: key);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  // PickedFile _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload de imagem View"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Scrollbar(
                isAlwaysShown: true,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    ImageItemWidget(titulo: "Imagem 1"),
                    SizedBox(
                      height: 30,
                    ),
                    ImageItemWidget(titulo: "Imagem 2"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
