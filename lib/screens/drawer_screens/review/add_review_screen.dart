import 'package:flutter/material.dart';
import 'package:haris_kitchen/provider/reservation_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/review_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/custom_text_field.dart';
import 'package:intl/intl.dart';

class AddReview extends StatefulWidget {
  const AddReview({Key? key}) : super(key: key);

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  // @override
  // void initState() {
  //   reservationProvider.timeofReservation.text = ""; //set the initial value of text field
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    ReviewProvider reviewProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: Scaffoldbackgroundcolour,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: primarycolour,
        title: Text(
          "Give A Review",
          style: TextStyle(color: textcolor, fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 48,
          child: reviewProvider.isloading == false
              ? MaterialButton(
                  onPressed: () {
                    reviewProvider.validator(context);
                  },
                  child: Text("Give A Review"),
                  color: primarycolour,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labText: "Review",
              controller: reviewProvider.reviewData,
            ),
          ],
        ),
      ),
    );
  }
}
