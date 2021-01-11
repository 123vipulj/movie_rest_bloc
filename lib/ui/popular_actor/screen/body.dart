import 'package:flutter/material.dart';
import 'package:movie_rest_bloc/ui/popular_movies/screen/title_name.dart';

import 'actor_list.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 11),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleName("Actors"),
          ActorList()
        ],
      ),
    );
  }

}