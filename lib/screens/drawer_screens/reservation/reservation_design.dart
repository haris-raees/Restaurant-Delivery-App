import 'package:flutter/material.dart';
import 'package:haris_kitchen/utils/colors.dart';

class ReservationDesign extends StatelessWidget {
  final String title;
  final String date;
  final String number;
  final String peoples;
  final String time;
  Function()? onDelete;
  // bool isBool = false;

  ReservationDesign({
    super.key,
    required this.title,
    required this.date,
    required this.number,
    required this.time,
    required this.peoples,
    this.onDelete,
    // required this.isBool,
  });

  @override
  Widget build(BuildContext context) {
    // return isBool == false
    //     ?
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              // Container(
              //   width: 60,
              //   padding: EdgeInsets.all(1),
              //   height: 20,
              //   decoration: BoxDecoration(
              //       color: primarycolour,
              //       borderRadius: BorderRadius.circular(10)),
              //   // child: Center(
              //   //   child: Text(
              //   //     addressType,
              //   //     style: TextStyle(fontSize: 13, color: Colors.black),
              //   //   ),
              //   // ),
              // ),
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
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: primarycolour,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Row(children: [
                Text(
                  "No. of Peoples:",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 20),
                ),
                Text(
                  peoples,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ]),
              Row(children: [
                Text(
                  "Date of Reservation:",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 20),
                ),
                Text(
                  date,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ]),
              Row(children: [
                Text(
                  "Time of Reservation:",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 20),
                ),
                Text(
                  time,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ]),
            ],
          ),
        ),
        Divider(
          height: 35,
          color: Colors.white,
        )
      ],
    );
    //   : Column(
    // children: [
    //   ListTile(
    //     title: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(
    //           title,
    //           style: TextStyle(color: Colors.white),
    //         ),
    //         Container(
    //           width: 60,
    //           padding: EdgeInsets.all(1),
    //           height: 20,
    //           decoration: BoxDecoration(
    //               color: primarycolour,
    //               borderRadius: BorderRadius.circular(10)),
    //           child: Center(
    //             child: Text(
    //               addressType,
    //               style: TextStyle(fontSize: 13, color: Colors.black),
    //             ),
    //           ),
    //         ),
    // IconButton(
    //   onPressed: onDelete,
    //   icon: Icon(
    //     Icons.delete,
    //     size: 30,
    //     color: Colors.grey,
    //   ),
    // ),
    //         ],
    //       ),
    //       leading: CircleAvatar(
    //         radius: 8,
    //         backgroundColor: primarycolour,
    //       ),
    //       subtitle: Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             address,
    //             style: TextStyle(color: Colors.white),
    //           ),
    //           SizedBox(
    //             height: 5,
    //           ),
    //           Text(
    //             number,
    //             style: TextStyle(color: Colors.white),
    //           )
    //         ],
    //       ),
    //     ),

    //   ],
    // );
  }
}
