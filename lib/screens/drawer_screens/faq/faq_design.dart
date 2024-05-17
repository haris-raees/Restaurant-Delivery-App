import 'package:flutter/material.dart';

class FAQDesign extends StatelessWidget {
  String question;
  String answer;

  FAQDesign({super.key, required this.question, required this.answer
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
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              question,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              answer,
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            // Text(
            //   "Table No. ${tableNo}",
            //   style: TextStyle(
            //       color: Colors.grey.shade600,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 17),
            // ),
          ],
        ),
      ),
    );
  }
}
