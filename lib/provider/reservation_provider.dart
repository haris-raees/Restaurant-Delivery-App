import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haris_kitchen/utils/models/delivery_address_model.dart';
import 'package:location/location.dart';

import '../utils/models/reservation_model.dart';

class ReservationProvider with ChangeNotifier {
  bool isloading = false;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController dateofReservation = TextEditingController();
  TextEditingController timeofReservation = TextEditingController();
  TextEditingController numberofPeoples = TextEditingController();
  // TextEditingController landmark = TextEditingController();
  // TextEditingController city = TextEditingController();
  // TextEditingController area = TextEditingController();
  // TextEditingController picode = TextEditingController();
  // LocationData? setLocation;

  void validator(context) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "First Name is empty");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Last Name is empty");
    } else if (mobileNumber.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mobile Number is empty");
    } else if (dateofReservation.text.isEmpty) {
      Fluttertoast.showToast(msg: "Date of Reservation is empty");
    } else if (timeofReservation.text.isEmpty) {
      Fluttertoast.showToast(msg: "Time of Reservation is empty");
    } else if (numberofPeoples.text.isEmpty) {
      Fluttertoast.showToast(msg: "Number of Peoples is empty");
      // } else if (landmark.text.isEmpty) {
      //   Fluttertoast.showToast(msg: "Landmark is empty");
      // } else if (city.text.isEmpty) {
      //   Fluttertoast.showToast(msg: "City is empty");
      // } else if (area.text.isEmpty) {
      //   Fluttertoast.showToast(msg: "Area is empty");
      // } else if (picode.text.isEmpty) {
      //   Fluttertoast.showToast(msg: "Picode is empty");
      // } else if (setLocation == null) {
      //   Fluttertoast.showToast(msg: "Set Location is empty");
    } else {
      isloading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("MakeReservation")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "First Name": firstName.text,
        "Last Name": lastName.text,
        "Mobile Number": mobileNumber.text,
        "Date of Reservation": dateofReservation.text,
        "Time of Reservation": timeofReservation.text,
        "Number of Peoples": numberofPeoples.text,
        // "Landmark": landmark.text,
        // "City": city.text,
        // "Area": area.text,
        // "Picode": picode.text,
        // "Address Type": myType.toString(),
        // "Longitude": setLocation!.longitude,
        // "Latitude": setLocation!.latitude,
      }).then((value) => {
                isloading = false,
                Fluttertoast.showToast(msg: "Make your reservation"),
                Navigator.of(context).pop(),
                notifyListeners(),
              });
      notifyListeners();
    }
  }

  List<ReservationModel> reservationList = [];
  getReservationData() async {
    List<ReservationModel> newList = [];

    ReservationModel reservationModel;
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("MakeReservation")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (_db.exists) {
      reservationModel = ReservationModel(
        firstName: _db.get("First Name"),
        lastName: _db.get("Last Name"),
        mobileNumber: _db.get("Mobile Number"),
        dateofReservation: _db.get("Date of Reservation"),
        timeofReservation: _db.get("Time of Reservation"),
        numberofPeoples: _db.get("Number of Peoples"),
        // landMark: _db.get("Landmark"),
        // city: _db.get("City"),
        // area: _db.get("Area"),
        // pinCode: _db.get("Picode"),
        // addressType: _db.get("Address Type"),
      );
      newList.add(reservationModel);
      notifyListeners();
    }

    reservationList = newList;
    notifyListeners();
  }

  List<ReservationModel> get getReservationList {
    return reservationList;
  }

  reservationDelete(reservationModel) {
    FirebaseFirestore.instance
        .collection("MakeReservation")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .delete();
    notifyListeners();
  }
}
