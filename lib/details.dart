
import 'package:flutter/material.dart';

import 'model/movie.dart';

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
      body: ListView(
        children:<Widget>[
          MovieDetailsThumbnail(thumbnail: movie.image[1]),
          MovieDetailsHeaderWithPoster(movie: movie)
        ]
      ),
      //  body: Center(
      //   child: Container(
      //     child: RaisedButton(
      //       child: Text("Go back  ${this.movie.director}"),
      //       onPressed: (){
      //         //go back to previous route
      //           Navigator.pop(context);
      //       }),
      //   ),
      // ),
    );
  }
}
 
class MovieDetailsThumbnail extends StatelessWidget {

  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children:<Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width:MediaQuery.of(context).size.width, //similar like match-parent
              height:190,
              decoration:BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(thumbnail),
                  fit:BoxFit.cover
                ),
              ),
            ),
            Icon(Icons.play_circle_outline,size: 100,
            color: Colors.white,)

          ],
        ),

          Container(
            decoration:BoxDecoration(
              gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
              ),
            ),
            height: 80,
          )


      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {

  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16),
        child: Row(
          children: <Widget>[
            MoviePoster(poster: movie.image[0].toString()),
            SizedBox(width: 16,),
            Expanded(
              child:MovieDetailsHeader(movie: movie,),
            )
        ],
        ),
      )
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  
  final Movie movie;

  const MovieDetailsHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${movie.year} . ${movie.genre}".toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.cyan
        ),),
        Text(movie.title,style: TextStyle(
          fontWeight:FontWeight.w400,
          fontSize:32
        ),),
        Text.rich(TextSpan(style: TextStyle(
          fontSize:12,fontWeight: FontWeight.w300
        ),children:<TextSpan>[
          TextSpan(
            text:movie.plot,
          ),
          TextSpan(
            text:"more..",style: TextStyle(
              color: Colors.indigoAccent
            )
          )
        ])),
      ],

    );
    
  }
}

class MoviePoster extends StatelessWidget {
  
  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
        return Card(
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Container(
              width:MediaQuery.of(context).size.width /4,
              height:160,
              decoration:BoxDecoration(
                image:DecorationImage(image: NetworkImage(poster),
                fit:BoxFit.cover
                )
              )
            ),
      ),
    );
  }
}