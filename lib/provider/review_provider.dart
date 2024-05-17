import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haris_kitchen/utils/models/delivery_address_model.dart';
import 'package:location/location.dart';

import '../utils/models/review_model.dart';

class ReviewProvider with ChangeNotifier {
  bool isloading = false;

  TextEditingController reviewData = TextEditingController();

  void validator(context) async {
    if (reviewData.text.isEmpty) {
      Fluttertoast.showToast(msg: "Review is empty");
    } else {
      isloading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("GivenReview")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "Review": reviewData.text,
      }).then((value) => {
                isloading = false,
                Fluttertoast.showToast(msg: "Give your review"),
                Navigator.of(context).pop(),
                notifyListeners(),
              });
      notifyListeners();
    }
  }

  List<ReviewModel> reviewList = [];
  getReviewData() async {
    List<ReviewModel> newList = [];

    ReviewModel reviewModel;
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("GivenReview")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (_db.exists) {
      reviewModel = ReviewModel(
        reviewData: _db.get("Review"),
      );
      newList.add(reviewModel);
      notifyListeners();
    }

    reviewList = newList;
    notifyListeners();
  }

  List<ReviewModel> get getReviewList {
    return reviewList;
  }

  reviewDelete(reviewModel) {
    FirebaseFirestore.instance
        .collection("GivenReview")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .delete();
    notifyListeners();
  }
}
