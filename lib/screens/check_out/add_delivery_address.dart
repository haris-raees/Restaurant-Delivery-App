import 'package:flutter/material.dart';
import 'package:haris_kitchen/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../provider/check_out_provider.dart';
import '../../utils/custom_text_field.dart';
import 'google_map/google_map.dart';

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({Key? key}) : super(key: key);

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum AddressTypes { Home, Work, Other }

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutPovider = Provider.of(context);
    return Scaffold(
      backgroundColor: Scaffoldbackgroundcolour,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: primarycolour,
        title: Text(
          "Add Delivery Address",
          style: TextStyle(color: textcolor, fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 48,
          child: checkoutPovider.isloading == false
              ? MaterialButton(
                  onPressed: () {
                    checkoutPovider.validator(context, myType);
                  },
                  child: Text("Add Address"),
                  color: primarycolour,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labText: "First Name",
              controller: checkoutPovider.firstName,
            ),
            CustomTextField(
              labText: "Last Name",
              controller: checkoutPovider.lastName,
            ),
            CustomTextField(
              labText: "Mobile Number",
              controller: checkoutPovider.mobileNumber,
            ),
            CustomTextField(
              labText: "Alternate Mobile Number (Optional)",
              controller: checkoutPovider.alternateMobileNumber,
            ),
            CustomTextField(
              labText: "Society",
              controller: checkoutPovider.society,
            ),
            CustomTextField(
              labText: "Street",
              controller: checkoutPovider.street,
            ),
            CustomTextField(
              labText: "Landmark (Optional)",
              controller: checkoutPovider.landmark,
            ),
            CustomTextField(
              labText: "City",
              controller: checkoutPovider.city,
            ),
            CustomTextField(
              labText: "Area",
              controller: checkoutPovider.area,
            ),
            CustomTextField(
              labText: "Pincode (Optional)",
              controller: checkoutPovider.picode,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CustomGoogleMap(),
                  ),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkoutPovider.setLocation == null
                        ? Text(
                            "Set Loaction",
                            style: TextStyle(color: Colors.white),
                          )
                        : Text(
                            "Your Location is set",
                            style: TextStyle(color: Colors.white),
                          ),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              title: Text(
                "Address Type*",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.white,
              ),
              child: RadioListTile(
                value: AddressTypes.Home,
                groupValue: myType,
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
                onChanged: (AddressTypes? value) {
                  setState(() {
                    myType = value!;
                  });
                },
                secondary: Icon(
                  Icons.home,
                  color: primarycolour,
                ),
              ),
            ),
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.white,
              ),
              child: RadioListTile(
                value: AddressTypes.Work,
                groupValue: myType,
                title: Text(
                  "Work",
                  style: TextStyle(color: Colors.white),
                ),
                onChanged: (AddressTypes? value) {
                  setState(() {
                    myType = value!;
                  });
                },
                secondary: Icon(
                  Icons.work,
                  color: primarycolour,
                ),
              ),
            ),
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.white,
              ),
              child: RadioListTile(
                value: AddressTypes.Other,
                groupValue: myType,
                title: Text(
                  "Other",
                  style: TextStyle(color: Colors.white),
                ),
                onChanged: (AddressTypes? value) {
                  setState(() {
                    myType = value!;
                  });
                },
                secondary: Icon(
                  Icons.other_houses,
                  color: primarycolour,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
