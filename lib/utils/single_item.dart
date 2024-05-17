import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haris_kitchen/utils/colors.dart';
import 'package:provider/provider.dart';

import '../provider/review_cart_provider.dart';
import 'count.dart';

class SingleItem extends StatefulWidget {
  SingleItem(
      {Key? key,
      required this.isBool,
      this.productImage,
      this.productName,
      this.productPrice,
      this.productId,
      this.productQuantity,
      this.onDelete,
      this.wishList})
      : super(key: key);
  bool isBool = false;
  String? productImage;
  String? productName;
  int? productPrice;
  String? productId;
  int? productQuantity;
  Function()? onDelete;
  bool? wishList = false;

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late ReviewCartProvider reviewCartProvider;
  late var count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  // @override
  // void initState() {
  //   getCount();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 100,
                child: Center(
                  child: Image.asset(widget.productImage!),
                ),
              )),
              Expanded(
                  child: Container(
                height: 90,
                child: Column(
                  mainAxisAlignment: widget.isBool == false
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.productName!,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${widget.productPrice}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    // widget.isBool == false
                    //     ? GestureDetector(
                    //         onTap: () {
                    //           showModalBottomSheet(
                    //               context: context,
                    //               builder: (context) {
                    //                 return Column(
                    //                     mainAxisSize: MainAxisSize.min,
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: <Widget>[
                    //                       // ListTile(
                    //                       //   title: new Text("Quantity 1"),
                    //                       //   onTap: () {
                    //                       //     Navigator.pop(context);
                    //                       //   },
                    //                       // ),
                    //                       // ListTile(
                    //                       //   title: new Text("Quantity 2"),
                    //                       //   onTap: () {
                    //                       //     Navigator.pop(context);
                    //                       //   },
                    //                       // ),
                    //                       // ListTile(
                    //                       //   title: new Text("Quantity 3"),
                    //                       //   onTap: () {
                    //                       //     Navigator.pop(context);
                    //                       //   },
                    //                       // ),
                    //                       // ListTile(
                    //                       //   title: new Text("Quantity 4"),
                    //                       //   onTap: () {
                    //                       //     Navigator.pop(context);
                    //                       //   },
                    //                       // )
                    //                     ]);
                    //               });
                    //         },
                    //         // child:
                    //   // Container(
                    //         //   margin: EdgeInsets.only(right: 15),
                    //         //   padding: EdgeInsets.symmetric(horizontal: 10),
                    //         //   height: 35,
                    //         //   decoration: BoxDecoration(
                    //         //       border: Border.all(color: Colors.grey),
                    //         //       borderRadius: BorderRadius.circular(30)),
                    //         //   child: Row(
                    //         //     children: [
                    //         //       // Expanded(
                    //         //       //     child: Text(
                    //         //       //   "Quantity 1",
                    //         //       //   style: TextStyle(
                    //         //       //       color: Colors.grey, fontSize: 14),
                    //         //       // )),
                    //         //       // Center(
                    //         //       //     child: Icon(
                    //         //       //   Icons.arrow_drop_down,
                    //         //       //   size: 20,
                    //         //       //   color: primarycolour,
                    //         //       // ))
                    //         //     ],
                    //         //   ),
                    //         // ),
                    //       )
                    //     : Text("Quantity 1"),
                  ],
                ),
              )),
              Expanded(
                  child: Container(
                height: 100,
                padding: widget.isBool == false
                    ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                    : EdgeInsets.only(left: 15, right: 15),
                child: widget.isBool == false
                    ? Count(
                        productId: widget.productId,
                        productName: widget.productName,
                        productImage: widget.productImage,
                        productPrice: widget.productPrice,
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          IconButton(
                            onPressed: widget.onDelete,
                            icon: Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                          widget.wishList == false
                              ? Container(
                                  height: 25,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (count == 1) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "You reach minimum limit.");
                                            } else {
                                              setState(() {
                                                count--;
                                              });
                                              reviewCartProvider
                                                  .updateReviewCartData(
                                                      cartImage:
                                                          widget.productImage,
                                                      cartId: widget.productId,
                                                      cartPrice:
                                                          widget.productPrice,
                                                      cartName:
                                                          widget.productName,
                                                      cartQuantity: count);
                                            }
                                          },
                                          child: Icon(
                                            Icons.remove,
                                            size: 20,
                                            color: primarycolour,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        Text(
                                          "$count",
                                          style:
                                              TextStyle(color: primarycolour),
                                        ),
                                        SizedBox(
                                          width: 7,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (count == 20) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "You have reach your limit.");
                                            } else {
                                              setState(() {
                                                count++;
                                              });
                                              reviewCartProvider
                                                  .updateReviewCartData(
                                                      cartImage:
                                                          widget.productImage,
                                                      cartId: widget.productId,
                                                      cartPrice:
                                                          widget.productPrice,
                                                      cartName:
                                                          widget.productName,
                                                      cartQuantity: count);
                                            }
                                          },
                                          child: Icon(
                                            Icons.add,
                                            size: 20,
                                            color: primarycolour,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
              )),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.white,
              )
      ],
    );
  }
}
