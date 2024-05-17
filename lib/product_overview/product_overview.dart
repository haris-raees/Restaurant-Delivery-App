import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/wish_list_provider.dart';
import '../screens/drawer_screens/review_cart.dart';
import '../utils/colors.dart';
import '../utils/count.dart';

enum SinginCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  const ProductOverview({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productAbout,
    required this.productPrice,
    required this.productId,
  }) : super(key: key);

  final String productName;
  final String productImage;
  final String productAbout;
  final int productPrice;
  final String? productId;

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SinginCharacter _character = SinginCharacter.fill;
  bool wishListBool = false;

  getWishListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (this.mounted)
                {
                  if (value.exists)
                    {
                      setState(
                        () {
                          wishListBool = value.get("wishList");
                        },
                      ),
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    getWishListBool();
    // print("ababaBBBbfhgfhgfhgfhgfh ${widget.productId}");
    return Scaffold(
      backgroundColor: Scaffoldbackgroundcolour,
      bottomNavigationBar: Row(
        children: [
          bottomNavigationBar(
              onTap: () {
                setState(() {
                  wishListBool = !wishListBool;
                });
                if (wishListBool == true) {
                  wishListProvider.addWishListData(
                    wishListId: widget.productId,
                    wishListImage: widget.productImage,
                    wishListName: widget.productName,
                    wishListPrice: widget.productPrice,
                    wishListQuantity: 2,
                  );
                } else {
                  wishListProvider.deleteWishList(widget.productId);
                }
              },
              icon: wishListBool == false
                  ? Icons.favorite_outline
                  : Icons.favorite,
              title: "Add To Wishlist",
              iconColor: Colors.grey,
              backgroundColor: Colors.grey.shade900,
              color: Colors.white70),
          bottomNavigationBar(
              icon: Icons.shopping_cart_outlined,
              title: "Go To Cart",
              iconColor: Colors.white70,
              backgroundColor: primarycolour,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
              color: textcolor)
        ],
      ),
      appBar: AppBar(
          backgroundColor: primarycolour,
          iconTheme: IconThemeData(color: textcolor),
          title: Text(
            "Product Overview",
            style: TextStyle(color: textcolor),
          )),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        widget.productName,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text("${widget.productPrice}",
                          style: TextStyle(color: Colors.white)),
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(40),
                      child: Image.asset(
                        widget.productImage,
                      ),
                    ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 20),
                    //   width: double.infinity,
                    //   child: Text(
                    //     "Available Option",
                    //     textAlign: TextAlign.start,
                    //     style: TextStyle(
                    //         color: Colors.white, fontWeight: FontWeight.w600),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.green[700],
                              ),
                              Radio(
                                  value: SinginCharacter.fill,
                                  groupValue: _character,
                                  onChanged: (value) {
                                    setState(() {
                                      _character = value!;
                                    });
                                  })
                            ],
                          ),
                          Text("${widget.productPrice}",
                              style: TextStyle(color: Colors.white)),
                          Count(
                            productId: widget.productId,
                            productName: widget.productName,
                            productImage: widget.productImage,
                            productPrice: widget.productPrice,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "About",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.productAbout,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}

bottomNavigationBar(
    {required IconData icon,
    required String title,
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    Function()? onTap}) {
  return Expanded(
      child: GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(20),
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
            color: iconColor,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(color: color),
          )
        ],
      ),
    ),
  ));
}
