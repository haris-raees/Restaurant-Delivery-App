import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haris_kitchen/provider/review_cart_provider.dart';
import 'package:haris_kitchen/utils/models/review_cart_model.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/rounded_button.dart';
import '../../utils/single_item.dart';
import '../check_out/delivery_details.dart';

class ReviewCart extends StatelessWidget {
  late ReviewCartProvider reviewCartProvider;
  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    // set up the buttons
    Widget cancelButton = OutlinedButton(
      // title: "No",
      // colour: Colors.grey.shade700,
      // onPress: () {
      //   Navigator.of(context).pop();
      // },
      style: OutlinedButton.styleFrom(backgroundColor: Colors.grey.shade700),
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      // backgroundColor: Colors.grey.shade700,
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        "No",
        style: TextStyle(color: Colors.white),
      ),
    );

    //

    Widget continueButton = OutlinedButton(
      style: OutlinedButton.styleFrom(backgroundColor: Colors.grey.shade700),
      onPressed: () {
        reviewCartProvider.reviewCartDataDelete(delete.cartId);
        Navigator.of(context).pop();
      },
      child: Text(
        "Yes",
        style: TextStyle(color: Colors.white),
      ),
    );
    //

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.grey.shade800,
      title: Text("Cart Product", style: TextStyle(color: Colors.white)),
      content: Text("Are you sure you want to delete cartProduct?",
          style: TextStyle(color: Colors.white)),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text('Total Amount', style: TextStyle(color: Colors.white)),
        subtitle: Text(
          "${reviewCartProvider.getTotalPrice()}",
          style: TextStyle(color: Colors.green[900], fontSize: 20),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            color: primarycolour,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {
              if (reviewCartProvider.reviewCartDataList.isEmpty) {
                Fluttertoast.showToast(msg: "No Cart Data Found.");
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DeliveryDetails(),
                  ),
                );
              }
            },
          ),
        ),
      ),
      backgroundColor: Scaffoldbackgroundcolour,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: primarycolour,
        title: Text(
          "Review Cart",
          style: TextStyle(color: textcolor, fontSize: 18),
        ),
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text(
                "NO DATA",
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      isBool: true,
                      wishList: false,
                      productImage: data.cartImage,
                      productName: data.cartName,
                      productPrice: data.cartPrice,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                      onDelete: () {
                        showAlertDialog(context, data);
                      },
                    ),
                  ],
                );
              },
            ),
      // reviewCartProvider.getReviewCartDataList.isEmpty
      //     ? Center(
      //         child: Text("NO DATA"),
      //       )
      //     //     :
      //     ListView
      //         // .builder
      // (
      // itemCount: reviewCartProvider.getReviewCartDataList.length,
      // itemBuilder: (context, index) {
      //   ReviewCartModel data =
      //       reviewCartProvider.getReviewCartDataList[index];
      //   return
      //     Column(children: [
      //   SizedBox(
      //     height: 10,
      //   ),
      //   SingleItem(
      //       isBool: true,
      //       productImage: "",
      //       productName: "",
      //       productPrice: 009,
      //       productId: "",
      //       productQuantity: 8888)
      // ]));
    );
  }
}
