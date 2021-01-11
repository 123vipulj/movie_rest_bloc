

import 'package:flutter/material.dart';
import 'package:movie_rest_bloc/ui/popular_movies/screen/popular_list.dart';
import 'package:movie_rest_bloc/ui/popular_movies/screen/title_name.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleName("Popular"),
          PopularList()
        ],
      ),
    );
  }

}