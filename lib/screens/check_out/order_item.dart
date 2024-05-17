import 'package:flutter/material.dart';
import 'package:haris_kitchen/utils/models/review_cart_model.dart';

class OrderItem extends StatelessWidget {
  late final ReviewCartModel? e;
  OrderItem({this.e});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        e!.cartImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            e!.cartName,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            "${e!.cartPrice}",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      subtitle: Text("x${e!.cartQuantity.toString()}",
          style: TextStyle(color: Colors.white)),
    );
  }
}
