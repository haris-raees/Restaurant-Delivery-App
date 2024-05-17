import 'package:flutter/material.dart';

import 'colors.dart';
import 'count.dart';

class SingalProducts extends StatelessWidget {
  const SingalProducts(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.onTap,
      required this.productPrice,
      this.productId})
      : super(key: key);

  final String productImage;
  final String productName;
  final VoidCallback onTap;
  final int productPrice;
  final String? productId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
            width: 165,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.asset(productImage),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$productPrice",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            // Expanded(
                            //   child: Container(
                            //     height: 30,
                            //     width: 50,
                            //     decoration: BoxDecoration(
                            //         border: Border.all(color: Colors.grey),
                            //         borderRadius: BorderRadius.circular(8)),
                            //   ),
                            // ),
                            SizedBox(width: 25),
                            Count(
                              productId: productId,
                              productName: productName,
                              productImage: productImage,
                              productPrice: productPrice,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
