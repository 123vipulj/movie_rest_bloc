import 'package:flutter/cupertino.dart';

import 'movie_image.dart';

class Body extends StatelessWidget{
  String id;

  Body(this.id);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: MovieImage(id));
  }

}