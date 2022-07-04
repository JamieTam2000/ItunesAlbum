import 'package:album/screens/album_details.dart';
import 'package:flutter/material.dart';
import 'package:album/album_list/album_list_viewModel.dart';


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
        itemBuilder: (BuildContext context,int index) { 
          final album = model.results[index];

          return Card(
          margin: EdgeInsets.zero,
          elevation: 10,
          color: Color.fromARGB(216, 232, 232, 232),   
          child: ListTile(
            leading:  
              Image.network(album.artworkUrl100.toString(),),
            title: Text(album.collectionName.toString(), overflow: TextOverflow.ellipsis,),
            subtitle: Text(album.artistName.toString()),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlbumPage(album) 
            ));
            },

        ),
      );
      })
      : Center(child: Image.asset('assets/itunes.png'))
      );
  
  }


}
