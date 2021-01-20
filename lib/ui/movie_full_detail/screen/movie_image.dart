import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_rest_bloc/bloc/block_provider.dart';
import 'package:movie_rest_bloc/bloc/movie_detail_fetch.dart';
import 'package:movie_rest_bloc/model/moviedetails/movie_detail.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../constant.dart';
import 'movie_cast_ui.dart';

class MovieImage extends StatefulWidget {
  String id;

  MovieImage(this.id);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MovieItemState(id);
  }
}

class _MovieItemState extends State<MovieImage> {
  String id;

  final bloc = MovieDetailFetch();

  _MovieItemState(this.id);

  @override
  Widget build(BuildContext context) {
    bloc.getMoviesList(id);
    return BlocProvider<MovieDetailFetch>(
      bloc: bloc,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: _buildStreamBuilder(bloc, context),
        ),
      ),
    );
  }
}

Widget _buildStreamBuilder(MovieDetailFetch result, BuildContext context) {
  return StreamBuilder(
    stream: result.moviesDetailStream,
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

      return _buildActorWidget(results.body, context);
    },
  );
}

Widget _buildActorWidget(MovieDetail movieDetail, BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  var chipColors = [
    Colors.green,
    Colors.blueGrey,
    Colors.deepOrange,
    Colors.indigoAccent,
    Colors.purple
  ];

  return Column(
    children: [
      Image.network(
        IMAGE_URL + movieDetail.backdropPath,
        height: screenSize.height * 0.4,
        fit: BoxFit.cover,
      ),
      Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieDetail.title,
                        style: TextStyle(
                            fontSize: 24,
                            fontFamily: 'firasans',
                            fontWeight: FontWeight.w200),
                      ),
                      Text(
                        movieDetail.tagLine,
                        style: TextStyle(fontSize: 16, fontFamily: 'brandon'),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.favorite_border,
                  color: Colors.redAccent,
                  size: 30,
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Budget",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        child: Text(
                          numDifferentiation(movieDetail.budget),
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'brandon'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Release Date ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                      Text(
                        movieDetail.releaseDate,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/imdb.png",
                            height: 40,
                            width: 40,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 8),
                            child: Text(movieDetail.voteAverage.toString(),
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700)),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey, width: 0.5),
                      bottom: BorderSide(color: Colors.grey, width: 0.5))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var s = 0; s < movieDetail.genres.length; s++)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: chipWidget(
                            movieDetail.genres[s].genreName, chipColors[s]),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(
                movieDetail.overView,
                style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'brandon',
                    fontWeight: FontWeight.w800,
                    color: Colors.black54),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                ),
                margin: const EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: Text(
                        "Cast",
                        style:
                            TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                      ),
                    ),
                    MovieCastUi(movieDetail.imdbId),
                  ],
                )),
          ],
        ),
      )
    ],
  );
}

Widget chipWidget(String genre, Color colors) {
  return Container(
    height: 30,
    width: 100,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(15), color: colors),
    child: Center(
      child: Text(
        genre,
        style: TextStyle(
            fontSize: 13,
            fontFamily: 'brandon',
            fontWeight: FontWeight.w900,
            color: Colors.white),
      ),
    ),
  );
}

String numDifferentiation(value) {
  var val = value.abs();
  if (val >= 10000000) {
    val = (val / 10000000).toStringAsFixed(2) + ' Cr';
  } else if (val >= 100000) {
    val = (val / 100000).toStringAsFixed(2) + ' Lac';
  }
  return val;
}
