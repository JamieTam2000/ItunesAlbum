import 'package:flutter/material.dart';
import 'package:album/album_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlbumList',
      debugShowCheckedModeBanner: false,
      home: AlbumList(),
    );
  }
}



