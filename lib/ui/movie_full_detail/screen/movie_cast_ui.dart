import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_rest_bloc/bloc/block_provider.dart';
import 'package:movie_rest_bloc/bloc/movie_cast_fetch.dart';
import 'package:movie_rest_bloc/model/cast/movie_cast.dart';

import '../../../constant.dart';

class MovieCastUi extends StatefulWidget {
  String mId;

  MovieCastUi(this.mId);

  @override
  State<StatefulWidget> createState() {
    return _MovieCastUi(mId);
  }
}

class _MovieCastUi extends State<MovieCastUi> {
  String mId;

  _MovieCastUi(this.mId);

  final bloc = MovieCastFetch();
  @override
  Widget build(BuildContext context) {
    bloc.getMoviesList(mId);
    return BlocProvider<MovieCastFetch>(
      bloc: bloc,
      child: Container(height: 260, child: _buildStreamBuilder(bloc)),
    );
  }
}

Widget _buildStreamBuilder(MovieCastFetch result) {
  return StreamBuilder(
    stream: result.moviesCastStream,
    builder: (context, snapshot) {
      final results = snapshot.data;
      if (results.body == null) {
        return Center(
          child: Lottie.asset('assets/lottie/loading.json',
              repeat: true,
              animate: true,
              reverse: false,
              width: 180,
              height: 150),
        );
      }

      return _buildActorWidget(results.body);
    },
  );
}

Widget _buildActorWidget(MovieCast movieCast) {
  return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      scrollDirection: Axis.horizontal,
      itemCount: movieCast.cast.length,
      itemBuilder: (context, index) {
        String url;
        if(movieCast.cast[index].actorImgPath != null){
          url = IMAGE_URL + movieCast.cast[index].actorImgPath;
        }else {
          url = "https://lanecdr.org/wp-content/uploads/2019/08/placeholder.png";
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            borderOnForeground: true,
            elevation: 0.3,
            child: Container(
              width: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          movieCast.cast[index].actorName,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w200,
                              fontFamily: 'firasans'),
                        ),
                        Container(
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.only(left: 4,right: 4),
                            child: Text(
                              movieCast.cast[index].chracter,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
