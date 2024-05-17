import 'package:flutter/material.dart';
import 'package:haris_kitchen/provider/product_provider.dart';
import 'package:haris_kitchen/provider/review_cart_provider.dart';
import 'package:haris_kitchen/screens/check_out/single_delivery_item.dart';
import 'package:haris_kitchen/utils/colors.dart';
import 'package:haris_kitchen/utils/models/delivery_address_model.dart';
import 'package:provider/provider.dart';

import '../../provider/check_out_provider.dart';
import 'order_item.dart';
import 'order_successful.dart';

class ConfirmOrder extends StatefulWidget {
  final DeliveryAddressModel? deliveryAddressList;
  ConfirmOrder({this.deliveryAddressList});

  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

enum AddressTypes { CashonDelivery, OnlinePayment }

class _ConfirmOrderState extends State<ConfirmOrder> {
  var myType = AddressTypes.CashonDelivery;
  @override
  Widget build(BuildContext context) {
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
          "Confirm Order",
          style: TextStyle(color: textcolor, fontSize: 18),
        ),
      ),
      backgroundColor: Scaffoldbackgroundcolour,
      bottomNavigationBar: ListTile(
        title: Text(
          "Total Amount",
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          "${total ?? totalPrice}",
          style: TextStyle(
              color: Colors.green[900],
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => OrderConfirm(),
              ));
            },
            child: Text("Place Order"),
            color: primarycolour,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SingleDeliveryItem(
                    isBool: true,
                    address:
                        "Area ${widget.deliveryAddressList!.area}, Street ${widget.deliveryAddressList!.street}, Society ${widget.deliveryAddressList!.society}, Pincode ${widget.deliveryAddressList!.pinCode}",
                    title:
                        "${widget.deliveryAddressList!.firstName} ${widget.deliveryAddressList!.lastName}",
                    number: widget.deliveryAddressList!.mobileNumber,
                    addressType: widget.deliveryAddressList!.addressType ==
                            "AddressTypes.Home"
                        ? "Home"
                        : widget.deliveryAddressList!.addressType ==
                                "AddressTypes.Other"
                            ? "Other"
                            : "Work",
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  ExpansionTile(
                      // iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      children:
                          reviewCartProvider.getReviewCartDataList.map((e) {
                        return OrderItem(e: e);
                      }).toList(),
                      title: Text(
                          "Order item ${reviewCartProvider.getReviewCartDataList.length}",
                          style: TextStyle(color: Colors.white))),
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
                  ListTile(
                    leading: Text("Payment Method",
                        style: TextStyle(color: Colors.white)),
                  ),
                  Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.white,
                    ),
                    child: RadioListTile(
                      value: AddressTypes.CashonDelivery,
                      groupValue: myType,
                      title: Text(
                        "Cash on Delivery",
                        style: TextStyle(color: Colors.white),
                      ),
                      onChanged: (AddressTypes? value) {
                        setState(() {
                          myType = value!;
                        });
                      },
                      secondary: Icon(
                        Icons.delivery_dining,
                        color: primarycolour,
                      ),
                    ),
                  ),
                  Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.white,
                    ),
                    child: RadioListTile(
                      value: AddressTypes.OnlinePayment,
                      groupValue: myType,
                      title: Text(
                        "Online Payment",
                        style: TextStyle(color: Colors.white),
                      ),
                      onChanged: (AddressTypes? value) {
                        setState(() {
                          myType = value!;
                        });
                      },
                      secondary: Icon(
                        Icons.payment,
                        color: primarycolour,
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
    );
  }
}
