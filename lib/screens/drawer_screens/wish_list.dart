import 'package:flutter/material.dart';
import 'package:haris_kitchen/provider/wish_list_provider.dart';
import 'package:haris_kitchen/utils/models/product_model.dart';
import 'package:provider/provider.dart';

import '../../utils/colors.dart';
import '../../utils/single_item.dart';

class WishList extends StatefulWidget {
  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = OutlinedButton(
      style: OutlinedButton.styleFrom(backgroundColor: Colors.grey.shade700),
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text(
        "No",
        style: TextStyle(color: Colors.white),
      ),
    );

    Widget continueButton = OutlinedButton(
      style: OutlinedButton.styleFrom(backgroundColor: Colors.grey.shade700),
      onPressed: () {
        wishListProvider.deleteWishList(delete.productId);
        Navigator.of(context).pop();
      },
      child: Text(
        "Yes",
        style: TextStyle(color: Colors.white),
      ),
    );

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

  late WishListProvider wishListProvider;
  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider.getWishListData();
    return Scaffold(
      backgroundColor: Scaffoldbackgroundcolour,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: primarycolour,
        title: Text(
          "WishList",
          style: TextStyle(color: textcolor, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishListProvider.getWishList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                isBool: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: data.productQuantity,
                onDelete: () {
                  showAlertDialog(context, data);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
