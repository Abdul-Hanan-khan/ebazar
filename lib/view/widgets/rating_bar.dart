import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class MyRatingBar extends StatelessWidget {

  double ?itemSize;
  int ?itemCount;
  double ?initialRating;
  double ?minRating;
  double ?maxRating;
  double ? starSpacing;
  Colors ?starColor;


  MyRatingBar(
      {this.itemSize,
      this.itemCount,
      this.initialRating,
      this.minRating,
      this.maxRating,
        this.starSpacing,
      this.starColor});

  @override
  Widget build(BuildContext context) {
    return   RatingBar.builder(

        itemSize: itemSize ?? 30,
      initialRating: initialRating ?? 3,
      minRating: minRating ?? 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount:itemCount ?? 5,
      itemPadding:  EdgeInsets.symmetric(horizontal: starSpacing ?? 0.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },

    );
  }
}
