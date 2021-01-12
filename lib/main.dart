

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:movie_rest_bloc/bloc/block_provider.dart';
import 'package:movie_rest_bloc/model/popularmovie/popular.dart';
import 'package:movie_rest_bloc/ui/popular_actor/popular_actor.dart';
import 'package:movie_rest_bloc/ui/popular_movies/popular_movies.dart';
import 'package:movie_rest_bloc/ui/search_movies/search_movies.dart';
import 'package:movie_rest_bloc/ui/slider_now_playing/now_playing_in_theater.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 0),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              NowPlayingInTheater(),
              SearchMoviesLay(_scrollController),
              PopularMovies(),
              PopularActor()
            ],
          ),
        ),
      ),
    );
  }

}






