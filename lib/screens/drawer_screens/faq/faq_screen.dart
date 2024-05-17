import 'package:flutter/material.dart';
import 'package:haris_kitchen/screens/drawer_screens/tables/tables_design.dart';

import '../../../utils/colors.dart';
import 'faq_design.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Scaffoldbackgroundcolour,
        appBar: AppBar(
          iconTheme: IconThemeData(color: textcolor),
          title: Text(
            'FAQ',
            style: TextStyle(color: textcolor, fontSize: 20),
          ),
          backgroundColor: primarycolour,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: ListView(
            // scrollDirection: Axis.horizontal,
            children: [
              FAQDesign(
                  question: "What happens if I don't reconfirm my booking?",
                  answer:
                      "Don't worry, your restaurant will still hold your booking without a reconfirmation."),
              SizedBox(
                height: 12,
              ),
              FAQDesign(
                  question: "What happens if I/'m running late?",
                  answer:
                      "Call the restaurant. Every restaurant is different, but most will hold a booking for at least twenty minutes before reassigning your table."),
              SizedBox(
                height: 12,
              ),
              FAQDesign(
                  question: "How much do I have to pay for my booking?",
                  answer:
                      "Absolutely nothing! All bookings made through Restaurant Hub are free to the consumer."),
              SizedBox(
                height: 12,
              ),
              FAQDesign(
                  question:
                      " I have particular food restriction, am I able to have a meal?",
                  answer:
                      "For sure! We will be glad to help you and propose dishes that may be suitable for you."),
              SizedBox(
                height: 12,
              ),
              FAQDesign(
                  answer:
                      "We have a full range menu from fish to meat dishes all fresh and in season. We strongly suggest our regional plates!",
                  question: "Which are your specialities?"),
            ],
          ),
        ));
  }
}
