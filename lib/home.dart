
import 'package:flutter/material.dart';

import 'model/movie.dart';

 
class MoviesListView extends StatelessWidget {

  final List<Movie> movieList = Movie.getMovies();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
          backgroundColor: Colors.blueGrey.shade900,
        ),
       backgroundColor: Colors.blueGrey.shade900,
       //pass itembuilder function and return card to body
       body: ListView.builder(
         itemCount: movieList.length,
         itemBuilder: (BuildContext context,int index){
           /*
           If want to add widget between another widget can,used stack
           and used Positioned */
           return Stack(
           children:<Widget>[
            
              movieCard(movieList[index], context)
               ,
             Positioned(
               top:10.0,
               child: movieImage(movieList[index].image[0])
              ),
       
           ]
           );
        //  return Card(
        //    elevation: 4.6,//add shadow to card
        //    color:Colors.white,
        //    child:ListTile(
        //      leading: CircleAvatar( //add avator to left listTile
        //        child:Container(
        //          width: 250,
        //          height: 250,
        //          decoration: BoxDecoration(
        //            image: DecorationImage(
        //              image: NetworkImage(movieList[index].image[0]),
        //               fit: BoxFit.cover
        //            ),
                   
        //            borderRadius: BorderRadius.circular(13.9)
        //          ),
        //          child:null
        //        )
        //      ),
        //      trailing: Text(".."),
        //      title:Text(movieList[index].title),
        //      subtitle: Text(movieList[index].title),
        //      onTap: (){
        //        //navigate to another route
        //        Navigator.push(context, MaterialPageRoute(
        //          //send args to another router
        //          builder: (context)=> MovieListViewDetails(movieName: movieList.elementAt(index).title,
        //          movie: movieList[index],)));
        //      },
        //     //  onTap: (){
        //     //    debugPrint("Movie name: ${movies.elementAt(index)}");
        //     //  },

        //    )
        //  );
       }),
      );
  }

//Movie Card
  Widget movieCard(Movie movie,BuildContext context){
    return InkWell(
      child:Container(
        margin:EdgeInsets.only(left:60.0),
        width:MediaQuery.of(context).size.width,
        height:120.0,
        child:Card(
          color:Colors.black45,
          child:Padding(
            padding: const EdgeInsets.only(
              top:8.0,
              bottom: 8.0,
              left: 54),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                          child: Text(movie.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Text("Rating: ${movie.imdbRating} /10",style: mainTextStyle(),),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Released: ${movie.released}",  style: mainTextStyle(),),
                      Text(movie.runtime,  style:mainTextStyle(),),
                      Text(movie.rated,  style: mainTextStyle(),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: (){
          //navigate to another route
                Navigator.push(context, MaterialPageRoute(
                  //send args to another router
                  builder: (context)=> MovieListViewDetails(
                    movieName:movie.title,
                    movie: movie,
                  )));
      },
    );
  }

TextStyle mainTextStyle(){
  return   TextStyle(
              fontSize:15.0,
              color:Colors.grey
           );
}

  Widget movieImage(String imageUrl){
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape:BoxShape.circle,
        image:DecorationImage(
          image:NetworkImage(imageUrl ?? 'https://i.picsum.photos/id/27/200/300.jpg'),
          fit:BoxFit.cover
        )
      ),
    );
  }
}


class MovieListViewDetails extends StatelessWidget {



//in stateless - variable cannot a null value
//that why add to constructor
  final String movieName;

final Movie movie;
  //constructor
  const MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Go back  ${this.movie.director}"),
            onPressed: (){
              //go back to previous route
                Navigator.pop(context);
            }),
        ),
      ),
    );
  }
}