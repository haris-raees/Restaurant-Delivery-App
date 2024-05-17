import 'package:flutter/material.dart';
import 'package:haris_kitchen/screens/drawer_screens/reservation/reservation_design.dart';
import 'package:haris_kitchen/screens/drawer_screens/review/review_screen_design.dart';
import 'package:provider/provider.dart';
// import 'package:haris_kitchen/screens/reservation/reservation_design.dart';

import '../../../provider/reservation_provider.dart';
import '../../../provider/review_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/models/reservation_model.dart';
import '../../../utils/models/review_model.dart';
import 'add_review_screen.dart';
// import '../../utils/colors.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  late ReviewModel value;
  late ReviewProvider reviewProvider;

  @override
  Widget build(BuildContext context) {
    ReviewProvider reviewProvider = Provider.of(context);
    reviewProvider.getReviewData();

    return Scaffold(
      backgroundColor: Scaffoldbackgroundcolour,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: primarycolour,
        title: Text(
          "Reviews",
          style: TextStyle(color: textcolor, fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: reviewProvider.getReviewList.isEmpty
              ? Text("Give A Review")
              : Text("Give A New Review"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddReview(),
            ));
          },
          color: primarycolour,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      body: ListView(children: [
        reviewProvider.getReviewList.isEmpty
            ? SizedBox(
                height: 50,
              )
            : Container(),
        reviewProvider.getReviewList.isEmpty
            ? Container(
                child: Center(
                  child: Text(
                    "No Data",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            : Column(
                children: reviewProvider.getReviewList.map<Widget>((e) {
                  setState(() {
                    value = e;
                  });
                  return ReviewDesign(
                    onDelete: () {
                      reviewProvider.reviewDelete(reviewProvider);
                    },
                    title: e.reviewData,
                  );
                }).toList(),
              )
      ]),
    );
  }
}
