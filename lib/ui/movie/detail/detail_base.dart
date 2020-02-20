

import 'package:flutter/material.dart';
import 'package:movies/model/movie.dart';

import 'detail_content.dart';

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
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.image)
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