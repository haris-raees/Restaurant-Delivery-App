import 'package:flutter/material.dart';
import 'package:haris_kitchen/provider/reservation_provider.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/custom_text_field.dart';
import 'package:intl/intl.dart';

class AddReservation extends StatefulWidget {
  const AddReservation({Key? key}) : super(key: key);

  @override
  State<AddReservation> createState() => _AddReservationState();
}

class _AddReservationState extends State<AddReservation> {
  // @override
  // void initState() {
  //   reservationProvider.timeofReservation.text = ""; //set the initial value of text field
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    ReservationProvider reservationProvider = Provider.of(context);

    return Scaffold(
      backgroundColor: Scaffoldbackgroundcolour,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: primarycolour,
        title: Text(
          "Make Reservation",
          style: TextStyle(color: textcolor, fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: 48,
          child: reservationProvider.isloading == false
              ? MaterialButton(
                  onPressed: () {
                    reservationProvider.validator(context);
                  },
                  child: Text("Add Reservation"),
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
              controller: reservationProvider.firstName,
            ),
            CustomTextField(
              labText: "Last Name",
              controller: reservationProvider.lastName,
            ),
            CustomTextField(
              labText: "Mobile Number",
              controller: reservationProvider.mobileNumber,
            ),
            // CustomTextField(
            //   labText: "Date of Reservation",
            //   controller: reservationProvider.dateofReservation,
            // ),

            TextField(
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101),
                    builder: (context, child) {
                      return Theme(
                        data: Theme.of(context).copyWith(
                          colorScheme: ColorScheme.light(
                            primary: Colors.grey.shade900, // <-- SEE HERE
                            onPrimary: Colors.white, // <-- SEE HERE
                            onSurface: Colors.black, // <-- SEE HERE
                          ),
                          textButtonTheme: TextButtonThemeData(
                            style: TextButton.styleFrom(
                              primary: Colors.black, // button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      reservationProvider.dateofReservation.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
                style: TextStyle(color: Colors.white),
                // style: TextStyle(color: Colors.white),
                // keyboardType: keyboardType,
                controller: reservationProvider.dateofReservation,
                decoration: InputDecoration(
                  labelText: "Date of Reservation",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                )),
            // CustomTextField(
            //   labText: "Time of Reservation",
            //   controller: reservationProvider.timeofReservation,
            // ),
            TextField(
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.light().copyWith(
                          primaryColor: Colors.black,
                          hintColor: Colors.grey.shade900,
                          colorScheme:
                              ColorScheme.light(primary: Colors.grey.shade900),
                          buttonTheme: ButtonThemeData(
                              textTheme: ButtonTextTheme.primary),
                        ),
                        child: child!,
                      );
                    },
                  );

                  if (pickedTime != null) {
                    print(pickedTime.format(context)); //output 10:51 PM
                    DateTime parsedTime = DateFormat.jm()
                        .parse(pickedTime.format(context).toString());
                    //converting to DateTime so that we can further format on different pattern.
                    print(parsedTime); //output 1970-01-01 22:53:00.000
                    String formattedTime =
                        DateFormat('HH:mm').format(parsedTime);
                    print(formattedTime); //output 14:59:00
                    //DateFormat() is from intl package, you can format the time on any pattern you need.

                    setState(() {
                      reservationProvider.timeofReservation.text =
                          formattedTime; //set the value of text field.
                    });
                  } else {
                    print("Time is not selected");
                  }
                },
                style: TextStyle(color: Colors.white),
                // style: TextStyle(color: Colors.white),
                // keyboardType: TextInputType(),
                controller: reservationProvider.timeofReservation,
                decoration: InputDecoration(
                  labelText: "Time of Reservation",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                )),
            CustomTextField(
              labText: "No. of Peoples",
              controller: reservationProvider.numberofPeoples,
            ),

            // CustomTextField(
            //   labText: "Landmark",
            //   controller: checkoutPovider.landmark,
            // ),
            // CustomTextField(
            //   labText: "City",
            //   controller: checkoutPovider.city,
            // ),
            // CustomTextField(
            //   labText: "Area",
            //   controller: checkoutPovider.area,
            // ),
            // CustomTextField(
            //   labText: "Pincode",
            //   controller: checkoutPovider.picode,
            // ),
            // InkWell(
            //   onTap: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => CustomGoogleMap(),
            //       ),
            //     );
            //   },
            //   child: Container(
            //     height: 47,
            //     width: double.infinity,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         checkoutPovider.setLocation == null
            //             ? Text(
            //           "Set Loaction",
            //           style: TextStyle(color: Colors.white),
            //         )
            //             : Text(
            //           "Your Location is set",
            //           style: TextStyle(color: Colors.white),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // Divider(
            //   color: Colors.white,
            // ),
            // ListTile(
            //   title: Text(
            //     "Address Type*",
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
            // Theme(
            //   data: ThemeData(
            //     unselectedWidgetColor: Colors.white,
            //   ),
            //   child: RadioListTile(
            //     value: AddressTypes.Home,
            //     groupValue: myType,
            //     title: Text(
            //       "Home",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //     onChanged: (AddressTypes? value) {
            //       setState(() {
            //         myType = value!;
            //       });
            //     },
            //     secondary: Icon(
            //       Icons.home,
            //       color: primarycolour,
            //     ),
            //   ),
            // ),
            // Theme(
            //   data: ThemeData(
            //     unselectedWidgetColor: Colors.white,
            //   ),
            //   child: RadioListTile(
            //     value: AddressTypes.Work,
            //     groupValue: myType,
            //     title: Text(
            //       "Work",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //     onChanged: (AddressTypes? value) {
            //       setState(() {
            //         myType = value!;
            //       });
            //     },
            //     secondary: Icon(
            //       Icons.work,
            //       color: primarycolour,
            //     ),
            //   ),
            // ),
            // Theme(
            //   data: ThemeData(
            //     unselectedWidgetColor: Colors.white,
            //   ),
            //   child: RadioListTile(
            //     value: AddressTypes.Other,
            //     groupValue: myType,
            //     title: Text(
            //       "Other",
            //       style: TextStyle(color: Colors.white),
            //     ),
            //     onChanged: (AddressTypes? value) {
            //       setState(() {
            //         myType = value!;
            //       });
            //     },
            //     secondary: Icon(
            //       Icons.other_houses,
            //       color: primarycolour,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
