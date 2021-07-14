import 'package:flutter/material.dart';

import 'image_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter upload photo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageView(),
    );
  }
}
