import 'package:flutter/material.dart';
import 'package:album/album_list_viewModel.dart';

class AlbumListView extends AlbumListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? CircularProgressIndicator()
        : Text("Album List"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => getAlbum(),),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(model.toString()),

        
        ),
      )))
    ;
  }


}
