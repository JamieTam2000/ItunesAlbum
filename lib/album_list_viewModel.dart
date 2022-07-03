import 'dart:convert';
import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:album/model.dart';
import 'package:album/album_list.dart';

abstract class AlbumListViewModel extends State<AlbumList> {
  final Url = "https://itunes.apple.com/search?term=jack+johnson&entity=album";
  List<Model> model = [];
  bool isLoading = false;

  Future<void> getAlbum() async {
    changeLoading();
    final response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      if (jsonBody is List) {
        model = jsonBody.map((e) => Model.fromJson(e)).toList().cast<Model>();
      }
    } else {
        throw Exception('Failed to load album');
    }


  }

void changeLoading() {
  setState(() {
    isLoading = !isLoading;
  }); 
}



}