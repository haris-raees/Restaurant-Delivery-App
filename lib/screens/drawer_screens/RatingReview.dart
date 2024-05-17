import 'package:flutter/material.dart';

class RatingReview extends StatefulWidget {
  const RatingReview({Key? key}) : super(key: key);

  @override
  State<RatingReview> createState() => _RatingReviewState();
}

class _RatingReviewState extends State<RatingReview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Rating Page"),
      ),
    );
  }
}
