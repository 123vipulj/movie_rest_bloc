

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:movie_rest_bloc/bloc/block_provider.dart';
import 'package:movie_rest_bloc/model/popular.dart';

import 'bloc/movie_fetch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final bloc = MovieFetch();


  @override
  Widget build(BuildContext context) {
    bloc.getMoviesList();
    return BlocProvider<MovieFetch>(
      bloc: bloc,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(child: _buildStreamBuilder(bloc)),
          ],
        ),
      ),
    );
  }
}

Widget _buildStreamBuilder(MovieFetch movieFetch){
  return StreamBuilder(
    stream: movieFetch.moviesList,
    builder: (context, snapshot) {
      final results = snapshot.data;

      if(results == null){

      }
      //
      // if(results.isEmpty){
      //
      // }

      return _buildMovieResult(results.body);
    },
  );
}

Widget _buildMovieResult(Popular popular){
  const String IMAGE_URL = "https://image.tmdb.org/t/p/w500/";
  return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: popular.results.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              IMAGE_URL + popular.results[index].posterPath),
                          fit: BoxFit.contain)),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        Text(popular.results[index].title,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Expanded(
                            child: Container(
                                child: Text(
                                  popular.results[index].overview,
                                  style: TextStyle(fontSize: 12),
                                ))),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      });

}

