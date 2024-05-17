import 'package:flutter/material.dart';
import 'package:haris_kitchen/provider/product_provider.dart';
import 'package:haris_kitchen/provider/review_cart_provider.dart';
import 'package:haris_kitchen/screens/check_out/single_delivery_item.dart';
import 'package:haris_kitchen/utils/colors.dart';
import 'package:haris_kitchen/utils/models/delivery_address_model.dart';
import 'package:provider/provider.dart';

import '../../../provider/check_out_provider.dart';
import '../../provider/check_out_provider.dart';
import 'package:haris_kitchen/screens/check_out/order_item.dart';
import 'order_successful.dart';

class MyOrder extends StatefulWidget {
  final DeliveryAddressModel? deliveryAddressList;
  MyOrder({this.deliveryAddressList});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

// enum AddressTypes { CashonDelivery, OnlinePayment }

class _MyOrderState extends State<MyOrder> {
  // var myType = AddressTypes.CashonDelivery;
  late DeliveryAddressModel value;
  late CheckoutProvider deliveryAddressProvider;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    CheckoutProvider checkoutProvider = Provider.of(context);
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    double discount = 30;

    double totalPrice = reviewCartProvider.getTotalPrice();
    var discountValue;
    var deliveryCharge;
    var total;
    if (totalPrice > 3000) {
      deliveryCharge = 100;
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue + deliveryCharge;
    } else {
      deliveryCharge = 100;
      discountValue = "No Vocher";
      total = totalPrice + deliveryCharge;
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: primarycolour,
        title: Text(
          "Your Order",
          style: TextStyle(color: textcolor, fontSize: 18),
        ),
      ),
      backgroundColor: Scaffoldbackgroundcolour,
      // bottomNavigationBar:
      body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(children: [
                Column(
                  children: deliveryAddressProvider.getDeliveryAddressList
                      .map<Widget>((e) {
                    return SingleDeliveryItem(
                      onDelete: () {
                        deliveryAddressProvider
                            .deliveryAddressDelete(deliveryAddressProvider);
                        // Navigator.of(context).pop();
                      },
                      isBool: true,
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
                ),
                Divider(
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                            "Order item ${reviewCartProvider.getReviewCartDataList.length}",
                            style:
                                TextStyle(color: Colors.white, fontSize: 17)),
                      ),
                    ),
                  ],
                ),

                Column(
                  // textColor: Colors.white,
                  // iconColor: Colors.white,
                  // collapsedIconColor: Colors.white,
                  children: reviewCartProvider.getReviewCartDataList.map((e) {
                    return OrderItem(e: e);
                  }).toList(),
                ),
                Divider(
                  color: Colors.white,
                ),
                ListTile(
                  minVerticalPadding: 5,
                  title: Text(
                    "Sub Total",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  trailing: Text(
                    "${totalPrice}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  title: Text(
                    "Delivery Charge",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "100",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  title: Text(
                    "Vocher Discount",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "$discountValue",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Row(children: [
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Total Amount",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    width: 195,
                  ),
                  Text(
                    "${total ?? totalPrice}",
                    style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                // ListTile(
                //   leading: Text("Payment Method",
                //       style: TextStyle(color: Colors.white)),
                // ),
                // Theme(
                //   data: ThemeData(
                //     unselectedWidgetColor: Colors.white,
                //   ),
                //   child: RadioListTile(
                //     value: AddressTypes.CashonDelivery,
                //     groupValue: myType,
                //     title: Text(
                //       "Cash on Delivery",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     onChanged: (AddressTypes? value) {
                //       setState(() {
                //         myType = value!;
                //       });
                //     },
                //     secondary: Icon(
                //       Icons.delivery_dining,
                //       color: primarycolour,
                //     ),
                //   ),
                // ),
                // Theme(
                //   data: ThemeData(
                //     unselectedWidgetColor: Colors.white,
                //   ),
                //   child: RadioListTile(
                //     value: AddressTypes.OnlinePayment,
                //     groupValue: myType,
                //     title: Text(
                //       "Online Payment",
                //       style: TextStyle(color: Colors.white),
                //     ),
                //     onChanged: (AddressTypes? value) {
                //       setState(() {
                //         myType = value!;
                //       });
                //     },
                //     secondary: Icon(
                //       Icons.payment,
                //       color: primarycolour,
                //     ),
                //   ),
                // ),
              ]);
            },
          )),
    );
  }
}
