import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemSize: 20,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
        size: 24,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

}