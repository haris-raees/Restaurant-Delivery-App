import 'package:flutter/material.dart';
import 'package:haris_kitchen/screens/check_out/single_delivery_item.dart';
import 'package:haris_kitchen/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../provider/check_out_provider.dart';
import '../../utils/models/delivery_address_model.dart';
import 'add_delivery_address.dart';
import 'confirm_order.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryAddressModel value;
  late CheckoutProvider deliveryAddressProvider;

  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();

    return Scaffold(
      backgroundColor: Scaffoldbackgroundcolour,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: primarycolour,
        title: Text(
          "Delivery Details",
          style: TextStyle(color: textcolor, fontSize: 18),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primarycolour,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddDeliveryAddress(),
          ));
        },
      ),
      bottomNavigationBar: Container(
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Text("Add new Address")
              : Text("Confirm Order"),
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
                ? Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddDeliveryAddress(),
                  ))
                : Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ConfirmOrder(
                      deliveryAddressList: value,
                    ),
                  ));
          },
          color: primarycolour,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Delivery To",
              style: TextStyle(color: Colors.white),
            ),
            leading: Image.asset(
              "images/location.png",
              height: 30,
            ),
          ),
          Divider(
            height: 1,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Container(
                  child: Center(
                    child: Text(
                      "No Data",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Column(
                  children: deliveryAddressProvider.getDeliveryAddressList
                      .map<Widget>((e) {
                    setState(() {
                      value = e;
                    });
                    return SingleDeliveryItem(
                      onDelete: () {
                        deliveryAddressProvider
                            .deliveryAddressDelete(deliveryAddressProvider);
                        // Navigator.of(context).pop();
                      },
                      isBool: false,
                      address:
                          "Area ${e.area}, Street ${e.street}, Society ${e.society}, Pincode ${e.pinCode}",
                      title: "${e.firstName} ${e.lastName}",
                      number: e.mobileNumber,
                      addressType: e.addressType == "AddressTypes.Home"
                          ? "Home"
                          : e.addressType == "AddressTypes.Other"
                              ? "Other"
                              : "Work",
                    );
                  }).toList(),
                )

          // children: [
          //   deliveryAddressProvider.getDeliveryAddressList.isEmpty
          //       ? Container(
          //           child: Center(
          //             child: Text(
          //               "No Data",
          //               style: TextStyle(color: Colors.white),
          //             ),
          //           ),
          //         )
          //       : SingleDeliveryItem(
          //           address:
          //               'area, Lahore/Pakistan, Samnabad, Street, 20, Sociaty 8, pincode 008',
          //           title: "Haris Raees",
          //           number: "03332001828",
          //           addressType: "Home",
          //         ),
          // ],
        ],
      ),
    );
  }
}
