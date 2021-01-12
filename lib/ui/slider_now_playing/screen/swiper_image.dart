import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_rest_bloc/bloc/background_pos.dart';
import 'package:movie_rest_bloc/bloc/block_provider.dart';
import 'package:movie_rest_bloc/bloc/now_playing_movie_fetch.dart';
import 'package:movie_rest_bloc/model/nowplaying/nowplaying.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:movie_rest_bloc/model/nowplaying/nowpresult.dart';

const String IMAGE_URL = "https://image.tmdb.org/t/p/w500/";
final posBloc = BackgroundPos();
Size size;

class SwipeImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SwipeImageState();
}

class _SwipeImageState extends State<SwipeImage> {
  final bloc = NowPlayingMovieFetch();

  @override
  Widget build(BuildContext context) {
    bloc.getNowPlayingMoviesList();
    size = MediaQuery.of(context).size;
    return BlocProvider<NowPlayingMovieFetch>(
      bloc: bloc,
      child: Container(
        height: size.height * 0.7,
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: _buildStreamBuilder(bloc),
        ),
      ),
    );
  }
}

Widget _buildStreamBuilder(NowPlayingMovieFetch movieFetch) {
  return StreamBuilder(
    stream: movieFetch.nowPlayingMoviesList,
    builder: (context, snapshot) {
      final results = snapshot.data;

      if (results == null) {}

      //
      // if(results.isEmpty){
      //
      // }

      return _buildNowPlayingMovies(results.body);
    },
  );
}

Widget _buildNowPlayingMovies(NowPlaying nowPlaying) {
  posBloc.setBackPosImage(0);
  return Stack(
    children: [
      Positioned(
        child: _buildSlidperPos(nowPlaying),
      ),
      Positioned(
        left: 0,
        top: 0,
        bottom: 0,
        right: 0,
        child: Swiper(
          onIndexChanged: (pos) {
            posBloc.setBackPosImage(pos);
          },
          fade: 0.4,
          control: SwiperControl(size: 0),
          autoplay: true,
          itemWidth: 200,
          itemCount: nowPlaying.results.length,
          indicatorLayout: PageIndicatorLayout.NONE,
          itemBuilder: (context, index) {
            return Image.network(
              IMAGE_URL + nowPlaying.results[index].posterPath,
              fit: BoxFit.contain,
            );
          },
          viewportFraction: 0.6,
          scale: 0.4,
        ),
      ),
    ],
  );
}

Widget _buildSlidperPos(NowPlaying nowPlaying) {
  return BlocProvider<BackgroundPos>(
    bloc: posBloc,
    child: StreamBuilder(
      stream: posBloc.getPos,
      builder: (context, snapshot) {
        final results = snapshot.data;

        return Container(
          child: Stack(
            children: [
              FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/images/placeholder.png"),
                image: NetworkImage(
                  IMAGE_URL + nowPlaying.results[results].posterPath,
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  decoration:
                      new BoxDecoration(color: Colors.black.withOpacity(0.5)),
                ),
              ),
              Positioned(
                top: size.height * 0.63,
                right: 0.0,
                left: 0.0,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    nowPlaying.results[results].originalTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: Colors.white,
                        fontFamily: 'firasans'),
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Lottie.asset('assets/lottie/ripple.json', repeat: true, animate: true, reverse: false, width: 35, height: 35),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(
                        "Running in Theater",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'brandon',
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    ),
  );
}
