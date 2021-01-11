import 'package:flutter/material.dart';
import 'package:movie_rest_bloc/ui/slider_now_playing/screen/swiper_image.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwipeImage()
      ],
    );
  }

}