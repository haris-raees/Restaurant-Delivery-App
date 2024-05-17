import 'package:flutter/material.dart';
import 'package:haris_kitchen/utils/colors.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addressType;
  Function()? onDelete;
  bool isBool = false;

  SingleDeliveryItem({
    super.key,
    required this.title,
    required this.address,
    required this.number,
    required this.addressType,
    this.onDelete,
    required this.isBool,
  });

  @override
  Widget build(BuildContext context) {
    return isBool == false
        ? Column(
            children: [
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: 60,
                      padding: EdgeInsets.all(1),
                      height: 20,
                      decoration: BoxDecoration(
                          color: primarycolour,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          addressType,
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ),
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
                leading: CircleAvatar(
                  radius: 8,
                  backgroundColor: primarycolour,
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      number,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              // Divider(
              //   height: 35,
              //   color: Colors.white,
              // )
            ],
          )
        : Column(
            children: [
              ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(color: Colors.white),
                    ),
                    Container(
                      width: 60,
                      padding: EdgeInsets.all(1),
                      height: 20,
                      decoration: BoxDecoration(
                          color: primarycolour,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          addressType,
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ),
                    ),
                    // IconButton(
                    //   onPressed: onDelete,
                    //   icon: Icon(
                    //     Icons.delete,
                    //     size: 30,
                    //     color: Colors.grey,
                    //   ),
                    // ),
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
                      address,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      number,
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              // Divider(
              //   height: 35,
              //   color: Colors.white,
              // )
            ],
          );
  }
}
