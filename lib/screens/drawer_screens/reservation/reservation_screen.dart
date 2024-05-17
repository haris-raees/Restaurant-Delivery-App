import 'package:flutter/material.dart';
import 'package:haris_kitchen/screens/drawer_screens/reservation/reservation_design.dart';
import 'package:provider/provider.dart';
// import 'package:haris_kitchen/screens/reservation/reservation_design.dart';

import '../../../provider/reservation_provider.dart';
import '../../../utils/colors.dart';
import '../../../utils/models/reservation_model.dart';
import 'add_reservation_details.dart';
// import '../../utils/colors.dart';

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  late ReservationModel value;
  late ReservationProvider reservationProvider;

  @override
  Widget build(BuildContext context) {
    ReservationProvider reservationProvider = Provider.of(context);
    reservationProvider.getReservationData();

    return Scaffold(
      backgroundColor: Scaffoldbackgroundcolour,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: primarycolour,
        title: Text(
          "Reservation",
          style: TextStyle(color: textcolor, fontSize: 18),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: primarycolour,
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.black,
      //   ),
      //   onPressed: () {
      //     Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => AddDeliveryAddress(),
      //     ));
      //   },
      // ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: reservationProvider.getReservationList.isEmpty
              ? Text("Make A Reservation")
              : Text("Make A New Reservation"),
          onPressed: () {
            // deliveryAddressProvider.getDeliveryAddressList.isEmpty
            //     ?
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddReservation(),
            ));
            //     : Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => ConfirmOrder(
            //     deliveryAddressList: value,
            //   ),
            // ));
          },
          color: primarycolour,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      body: ListView(children: [
        //   ListTile(
        //   title: Text(
        //     "Delivery To",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   leading: Image.asset(
        //     "images/location.png",
        //     height: 30,
        //   ),
        // ),
        // Divider(
        //   height: 1,
        // ),
        reservationProvider.getReservationList.isEmpty
            ? SizedBox(
                height: 50,
              )
            : Container(),
        reservationProvider.getReservationList.isEmpty
            ? Container(
                child: Center(
                  child: Text(
                    "No Data",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              )
            : Column(
                children:
                    reservationProvider.getReservationList.map<Widget>((e) {
                  setState(() {
                    value = e;
                  });
                  return ReservationDesign(
                    onDelete: () {
                      reservationProvider
                          .reservationDelete(reservationProvider);
                      // Navigator.of(context).pop();
                    },
                    // isBool: false,
                    // address:
                    // "Area ${e.area}, Street ${e.street}, Society ${e.society}, Pincode ${e.pinCode}",
                    title: "${e.firstName} ${e.lastName}",
                    date: " ${e.dateofReservation}",
                    //     title: "Haris Raees",
                    //     number: "03332001828",
                    peoples: "${e.numberofPeoples}",
                    time: "${e.timeofReservation}",
                    number: e.mobileNumber,
                    // addressType: e.addressType == "AddressTypes.Home"
                    //     ? "Home"
                    //     : e.addressType == "AddressTypes.Other"
                    //     ? "Other"
                    //     : "Work",
                  );
                }).toList(),
              )
      ]

          // children: [
          // deliveryAddressProvider.getDeliveryAddressList.isEmpty
          //     ?
          // Container(
          //   child: Center(
          //     child: Text(
          //       "No Data",
          //       style: TextStyle(color: Colors.white),
          //     ),
          //   ),
          // )
          // :
          //   ReservationDesign(
          //     date: "Date: 11 Nov 2022",
          //     title: "Haris Raees",
          //     number: "03332001828",
          //     peoples: "No. of Peoples: 5",
          //     time: "6:00 AM",
          //   ),
          // ],
          // ],
          ),
    );
  }
}
