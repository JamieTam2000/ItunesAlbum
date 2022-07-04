import 'package:flutter/material.dart';
import 'package:album/album_list_viewModel.dart';

class AlbumListView extends AlbumListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? CircularProgressIndicator()
        : Text("Itunes Album List"),
      ),

      floatingActionButton: !isDone ? 
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 10.0, 30.0),
        child : FloatingActionButton.extended(onPressed: () => getAlbum(),
          icon: Icon(Icons.autorenew),
          label: Text('Load Album'),
          backgroundColor: Colors.pink,
          elevation: 10,))
          : null,
      
      body: isDone ? ListView.builder(
        itemCount: model.results.length,
        itemBuilder: (BuildContext context,int index) => Card(
          
        child: ListTile(
          title: Image.network(model.results[index].artworkUrl100.toString()),
          subtitle: Text(model.results[index].artistId.toString()),        
        ),
      ))
      : Center(child: Image.asset('assets/itunes.png'))
      );
    
  }


}
