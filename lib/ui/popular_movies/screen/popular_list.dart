import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_rest_bloc/bloc/block_provider.dart';
import 'package:movie_rest_bloc/bloc/movie_fetch.dart';
import 'package:movie_rest_bloc/model/popularmovie/popular.dart';
import 'package:movie_rest_bloc/ui/movie_full_detail/movie_full_detail.dart';
import 'package:movie_rest_bloc/ui/popular_movies/popular_movies.dart';
import 'package:movie_rest_bloc/ui/popular_movies/screen/rating_movie.dart';

import '../../../constant.dart';

class PopularList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PopularStateFull();
  }
}

class _PopularStateFull extends State<PopularList> {
  final bloc = MovieFetch();

  @override
  Widget build(BuildContext context) {
    bloc.getMoviesList();
    return BlocProvider<MovieFetch>(
      bloc: bloc,
      child: Container(
        height: 330,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildStreamBuilder(bloc),
        ),
      ),
    );
  }
}

Widget _buildStreamBuilder(MovieFetch movieFetch) {
  return StreamBuilder(
    stream: movieFetch.moviesList,
    builder: (context, snapshot) {
      final results = snapshot.data;

      if (results == null) {
        return Center(
          child: Lottie.asset('assets/lottie/loading.json',
              repeat: true,
              animate: true,
              reverse: false,
              width: 150,
              height: 150),
        );
      }


      return _buildMovieResult(results.body);
    },
  );
}

Widget _buildMovieResult(Popular popular) {

  return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      scrollDirection: Axis.horizontal,
      itemCount: popular.results.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 140,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      IMAGE_URL + popular.results[index].posterPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MovieFullDetail(popular.results[index].id.toString())));
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          popular.results[index].title,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                          fontFamily: 'brandon'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      RatingStar(),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      });
}
