import 'package:album/screens/album_details.dart';
import 'package:flutter/material.dart';
import 'package:album/album_list/album_list_viewModel.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
        shrinkWrap: false,
        itemBuilder: (BuildContext context,int index) { 
          final album = model.results[index];

          return Card(
          margin: EdgeInsets.zero,
          elevation: 10,
          color: Color.fromARGB(216, 232, 232, 232),   
          child: Slidable(
            startActionPane: ActionPane(
              motion: StretchMotion(),              
              children: [
                SlidableAction(onPressed: bookmark(),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                icon: Icons.favorite,
                label: 'Bookmark',
                ),
                SlidableAction(onPressed: share(),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Share',
                ),                 
              ],
            ),                     
            child: ListTile(
              
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: CircleAvatar(
                radius: 28,  
                backgroundImage: NetworkImage(album.artworkUrl100.toString()),),
              title: album.collectionName.length >= 36 ?           
                SizedBox(height: 20.0,
                  child:  Marquee(text: album.collectionName.toString(),
                  blankSpace: 40.0,
                  velocity: 30.0,
                  pauseAfterRound: Duration(seconds: 2),))
                : Text(album.collectionName.toString(),),
              subtitle: Text(album.artistName.toString(), overflow: TextOverflow.ellipsis,),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AlbumPage(album))
                );},

          ),)
        );
        })
        : Center(child: Image.asset('assets/itunes.png'))
        );
  
  }


}
