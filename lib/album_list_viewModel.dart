import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:album/model.dart';
import 'package:album/album_list.dart';

abstract class AlbumListViewModel extends State<AlbumList> {
  final Url = "https://itunes.apple.com/search?term=jack+johnson&entity=album";
  
  bool isLoading = false;
  
  Future<void> getAlbum() async {
    changeLoading();
    final response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      final models = json.decode(response.body.toString());
      var model = models
              .map((e) => Model.fromJson(e))
              .toList()
              .cast<Model>();
      }
     else {
        throw Exception('Failed to load album');
     }
    changeLoading();
    ;
}

void changeLoading() {
  setState(() {
    isLoading = !isLoading;
  }); 
}



}