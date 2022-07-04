import 'package:flutter/material.dart';
import 'package:album/album_list_viewModel.dart';

class AlbumListView extends AlbumListViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? CircularProgressIndicator()
          : Text("Itunes Album List"),
        backgroundColor: Colors.purple,
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
          elevation: 6,
          margin: EdgeInsets.symmetric(horizontal:5, vertical: 5),
          color: Color.fromARGB(216, 232, 232, 232),   
          child: ListTile(
            leading: SizedBox(height: 150, width: 100, 
              child: Image.network(model.results[index].artworkUrl100.toString(),)),
            title: Text(model.results[index].collectionName.toString(), overflow: TextOverflow.ellipsis,),
            subtitle: Text(model.results[index].artistName.toString()),
            trailing: Icon(Icons.arrow_forward_ios),        
        ),
      ))
      : Center(child: Image.asset('assets/itunes.png'))
      );
    
  }


}
