import 'package:flutter/material.dart';
import 'package:album/album_list/album_list_viewModel.dart';

class AlbumPage extends StatelessWidget {
  final album;

AlbumPage(this.album); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.collectionName),
      ),
      body: Center(child: Text(album.artistName),)  
      
      
      
    );
  }

}