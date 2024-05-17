import 'package:flutter/material.dart';
import 'package:haris_kitchen/screens/drawer_screens/tables/tables_design.dart';

import '../../../utils/colors.dart';

class Tables extends StatefulWidget {
  const Tables({Key? key}) : super(key: key);

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Scaffoldbackgroundcolour,
        appBar: AppBar(
          iconTheme: IconThemeData(color: textcolor),
          title: Text(
            'Tables',
            style: TextStyle(color: textcolor, fontSize: 20),
          ),
          backgroundColor: primarycolour,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: ListView(
              // scrollDirection: Axis.horizontal,
              children: [
                Row(
                  children: [
                    TablesDesign(tableNo: "1"),
                    SizedBox(
                      width: 5,
                    ),
                    TablesDesign(tableNo: "2"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    TablesDesign(tableNo: "3"),
                    SizedBox(
                      width: 5,
                    ),
                    TablesDesign(tableNo: "4"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    TablesDesign(tableNo: "5"),
                    SizedBox(
                      width: 5,
                    ),
                    TablesDesign(tableNo: "6"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ]),
        ));
  }
}
