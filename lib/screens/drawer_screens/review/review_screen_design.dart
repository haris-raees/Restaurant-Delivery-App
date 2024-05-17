import 'package:haris_kitchen/utils/colors.dart';
import 'package:flutter/material.dart';

class ReviewDesign extends StatelessWidget {
  final String title;
  Function()? onDelete;
  // bool isBool = false;

  ReviewDesign({
    super.key,
    this.onDelete,
    required this.title,
    // required this.isBool,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            IconButton(
              onPressed: onDelete,
              icon: Icon(
                Icons.delete,
                size: 30,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      // leading: CircleAvatar(
      //   radius: 8,
      //   backgroundColor: primarycolour,
      // ),
      Divider(
        height: 35,
        color: Colors.white,
      ),
    ]);
  }
}
