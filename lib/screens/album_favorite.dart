import 'package:album/album_list/album_list_view.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:album/screens/album_details.dart';


class FavoritePage extends StatelessWidget {
  final favoriteList;
  FavoritePage(this.favoriteList); 

 @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Favorite List"),
        backgroundColor: Colors.purple,
      ),

      body: ListView.builder(
        itemCount: favoriteList.length,
        shrinkWrap: false,
        itemBuilder: (BuildContext context,int index) { 
        final favoriteAlbum = favoriteList[index];       
          return Card(
          margin: EdgeInsets.zero,
          elevation: 10,
          color: Color.fromARGB(247, 232, 232, 232),   
            child: ListTile(
              
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              leading: CircleAvatar(
                radius: 28,  
                backgroundImage: NetworkImage(favoriteAlbum.artworkUrl100.toString()),),
              title: favoriteAlbum.collectionName.length >= 36 ?           
                SizedBox(height: 20.0,
                  child:  Marquee(text: favoriteAlbum.collectionName.toString(),
                  blankSpace: 40.0,
                  velocity: 30.0,
                  pauseAfterRound: Duration(seconds: 2),))
                : Text(favoriteAlbum.collectionName.toString(),),
              subtitle: Text('By ${favoriteAlbum.artistName}', overflow: TextOverflow.ellipsis,),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AlbumPage(favoriteList[index]))
                );},

          ),);
        }
        ));
  }
  

        
        
        
}  
  



