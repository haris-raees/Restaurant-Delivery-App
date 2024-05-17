import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haris_kitchen/utils/models/delivery_address_model.dart';
import 'package:location/location.dart';

class CheckoutProvider with ChangeNotifier {
  bool isloading = false;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController alternateMobileNumber = TextEditingController();
  TextEditingController society = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController picode = TextEditingController();
  LocationData? setLocation;

  void validator(context, myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "First Name is empty");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Last Name is empty");
    } else if (mobileNumber.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mobile Number is empty");
      // } else if (alternateMobileNumber.text.isEmpty) {
      //   Fluttertoast.showToast(msg: "Alternate Mobile Number is empty");
    } else if (society.text.isEmpty) {
      Fluttertoast.showToast(msg: "Society is empty");
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: "Street is empty");
      // } else if (landmark.text.isEmpty) {
      //   Fluttertoast.showToast(msg: "Landmark is empty");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "City is empty");
    } else if (area.text.isEmpty) {
      Fluttertoast.showToast(msg: "Area is empty");
      // } else if (picode.text.isEmpty) {
      //   Fluttertoast.showToast(msg: "Picode is empty");
    } else if (setLocation == null) {
      Fluttertoast.showToast(msg: "Set Location is empty");
    } else {
      isloading = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("AddDeliveryAddress")
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        "First Name": firstName.text,
        "Last Name": lastName.text,
        "Mobile Number": mobileNumber.text,
        "Alternate Mobile Number": alternateMobileNumber.text,
        "Society": society.text,
        "Street": street.text,
        "Landmark": landmark.text,
        "City": city.text,
        "Area": area.text,
        "Picode": picode.text,
        "Address Type": myType.toString(),
        "Longitude": setLocation!.longitude,
        "Latitude": setLocation!.latitude,
      }).then((value) => {
                isloading = false,
                Fluttertoast.showToast(msg: "Add your delivery address"),
                Navigator.of(context).pop(),
                notifyListeners(),
              });
      notifyListeners();
    }
  }

  List<DeliveryAddressModel> deliveryAddressList = [];
  getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];

    DeliveryAddressModel deliveryAddressModel;
    DocumentSnapshot _db = await FirebaseFirestore.instance
        .collection("AddDeliveryAddress")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (_db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        firstName: _db.get("First Name"),
        lastName: _db.get("Last Name"),
        mobileNumber: _db.get("Mobile Number"),
        alternateMobileNumber: _db.get("Alternate Mobile Number"),
        society: _db.get("Society"),
        street: _db.get("Street"),
        landMark: _db.get("Landmark"),
        city: _db.get("City"),
        area: _db.get("Area"),
        pinCode: _db.get("Picode"),
        addressType: _db.get("Address Type"),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }

    deliveryAddressList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryAddressList {
    return deliveryAddressList;
  }

  deliveryAddressDelete(deliveryAddressModel) {
    FirebaseFirestore.instance
        .collection("AddDeliveryAddress")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .delete();
    notifyListeners();
  }
}
