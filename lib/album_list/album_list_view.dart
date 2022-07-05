import 'package:album/screens/album_details.dart';
import 'package:flutter/material.dart';
import 'package:album/album_list/album_list_viewModel.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:album/screens/album_favorite.dart';
class AlbumListView extends AlbumListViewModel {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? CircularProgressIndicator()
          : Text("Itunes Album List"),
        backgroundColor: Colors.purple,
      ),

      drawer: Drawer(
        child: Container(
          color: Color.fromRGBO(50, 75, 205, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(height: 50),
              ListTile(
                leading: Icon(Icons.favorite_border, color: Colors.white,),
                title: Text('My Favorite', style: TextStyle(color: Colors.white),),
                
                onTap: (){ 
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FavoritePage(favoriteList))
                );},
              )
              
          
          ],
      ),)) ,

      floatingActionButton: !isDone ? 
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 10.0, 30.0),
        child : FloatingActionButton.extended(
          onPressed: () => getAlbum(),
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
          color: Color.fromARGB(247, 232, 232, 232),   
          child: Slidable(
            startActionPane: ActionPane(
              motion: StretchMotion(),
              extentRatio: 0.5,              
              children: [
                SlidableAction(onPressed: ((context) => setState(() {
                  bookmark[index] = !bookmark[index];
                  if(bookmark[index] == true){
                  favoriteList.add(album);
                  } else {favoriteList.remove(album);}
                })),
                backgroundColor: Color.fromARGB(255, 31, 125, 226),
                foregroundColor: Colors.white,
                icon: bookmark[index] ? Icons.favorite : Icons.favorite_border,
                label: 'Bookmark',
                ),
                SlidableAction(onPressed: ((context) => doSth()),
                backgroundColor: Color.fromARGB(255, 61, 194, 97),
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
              subtitle: Text('By ${album.artistName}', overflow: TextOverflow.ellipsis,),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AlbumPage(album))
                );},

          ),)
        );
        }
        )
        : Center(child: Image.asset('assets/itunes.png'))
        );
  
  }

doSth(){

}



}
