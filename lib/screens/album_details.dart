import 'dart:ui';

import 'package:flutter/material.dart';


class AlbumPage extends StatelessWidget {
  final album;

AlbumPage(this.album); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.collectionName),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,       
          children: <Widget>[ 
            Expanded(
              flex: 2,
              
              child: Container(
                alignment: Alignment.topRight,
                color: Colors.amber,
               child: Image.network(album.artworkUrl100,fit: BoxFit.cover,),)),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.black,
              
            ),)
           

          ],
        ),))  
      
      
      
    ;
  }

}