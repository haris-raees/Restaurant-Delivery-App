import 'package:flutter/material.dart';
import 'package:haris_kitchen/utils/colors.dart';

import '../menu/menu_screen.dart';

class OrderConfirm extends StatelessWidget {
  // final String OrderId;
  // final int? status;
  // OrderConfirm({this.status});

  @override
  Widget build(BuildContext context) {
    // if (status == 0) {
    //   Future.delayed(Duration(seconds: 1));
    // }
    return Scaffold(
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: Text("Back To Menu"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MenuScreen(),
            ));
          },
          color: primarycolour,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      backgroundColor: Scaffoldbackgroundcolour,
      body: Center(
        child: SizedBox(
          // width: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // status == 1
              //     ?
              Icon(
                Icons.check_circle,
                size: 100,
                color: Colors.green,
              ),
              // : Icon(
              //     Icons.warning,
              //     size: 20,
              //     color: Colors.red,
              //   ),
              SizedBox(
                height: 10,
              ),
              Text(
                // status == 1
                //     ?
                "Your Order is placed successfully",
                // : "Your order failed",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                  // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  children: [
                    Text(
                      // status == 1 ?
                      "Successful Order",
                      // : "Failed Order",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ]),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
