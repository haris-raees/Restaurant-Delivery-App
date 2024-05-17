import 'package:flutter/material.dart';

class TablesDesign extends StatelessWidget {
  String tableNo;
  TablesDesign({
    super.key,
    required this.tableNo,
    // required this.isBool,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 175,
      width: 135,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 150,
              padding: EdgeInsets.all(5),
              width: double.infinity,
              child: Icon(
                Icons.table_restaurant,
                color: Colors.black,
                size: 70,
              ),
            ),
          ),
          Text(
            "Table No. ${tableNo}",
            style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
        ],
      ),
    );
  }
}
