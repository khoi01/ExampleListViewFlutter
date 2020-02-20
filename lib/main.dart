import 'package:flutter/material.dart';

import 'ui/movie/list/list_base.dart';



 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MoviesListView()
    );
  }
}

