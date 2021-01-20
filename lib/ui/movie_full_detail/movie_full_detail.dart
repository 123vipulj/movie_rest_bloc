import 'package:flutter/material.dart';
import 'package:movie_rest_bloc/ui/movie_full_detail/screen/body.dart';

class MovieFullDetail extends StatelessWidget{
  String mId;

  MovieFullDetail(this.mId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Body(mId));
  }

}