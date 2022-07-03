import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:album/model.dart';
import 'package:album/album_list.dart';



abstract class AlbumListViewModel extends State<AlbumList> {
  final Url = "https://itunes.apple.com/search?term=jack+johnson&entity=album";
  var model;
  bool isLoading = false;
  bool isDone = false;
  Future<void> getAlbum() async {
    changeLoading();
    final response = await http.get(Uri.parse(Url));
   
      final jsonData = json.decode(response.body);
       model = Model.fromJson(jsonData);
          
             

    changeLoading();   
  isDone = true; 
}

void changeLoading() {
  setState(() {
    isLoading = !isLoading;
  }); 
}



}