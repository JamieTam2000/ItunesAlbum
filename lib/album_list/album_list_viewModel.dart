import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'package:album/model/model.dart';
import 'package:album/screens/album_list.dart';
import 'package:album/album_list/album_list_view.dart';


abstract class AlbumListViewModel extends State<AlbumList> {
  final Url = "https://itunes.apple.com/search?term=jack+johnson&entity=album";
  var model;
  bool isLoading = false;
  bool isDone = false;
  List favoriteList = [];
  // Bad codes final bookmark = List<bool>.filled(50, false) ;
  final bookmark = List<bool>.filled(50, false) ;

  Future<void> getAlbum() async {
    changeLoading();

    final response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      model = Model.fromJson(jsonData); 
      isDone = true;
                          
    } else {
      throw Exception("Fail to load album");
    }

    changeLoading();   
     
}

void changeLoading() {
  setState(() {
    isLoading = !isLoading;
  }); 
}
}








