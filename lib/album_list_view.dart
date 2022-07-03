import 'package:album/model.dart';
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
        itemCount: isDone ? model.results.length : 0,
        itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Image.network(model.results[index].artworkUrl100.toString()),
          subtitle: Text(model.results[index].artistId.toString()),        
        ),
      )))
    ;
  }


}
