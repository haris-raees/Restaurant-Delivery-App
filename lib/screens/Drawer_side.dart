import 'package:flutter/material.dart';
import 'package:haris_kitchen/screens/menu/menu_screen.dart';
import 'package:provider/provider.dart';

import '../provider/sign_in_provider.dart';
import 'drawer_screens/faq/faq_screen.dart';
import 'drawer_screens/my_profile.dart';
import 'drawer_screens/reservation/reservation_screen.dart';
import 'drawer_screens/review/review_screen.dart';
import 'drawer_screens/review_cart.dart';
import 'drawer_screens/tables/tables.dart';
import 'drawer_screens/wish_list.dart';
import '../utils/colors.dart';

class DrawerSide extends StatefulWidget {
  const DrawerSide({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Future getData() async {
    final sp = context.read<SignInProvider>();
    sp.getDataFromSharedPreferences();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final sp = context.watch<SignInProvider>();
    return Drawer(
      child: Container(
        color: Color(0xffec9422),
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 37,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("${sp.imageUrl}"),
                      radius: 35,
                      backgroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "${sp.name}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      // Container(
                      //   height: 39,
                      //   child: ElevatedButton(
                      //     style: ButtonStyle(
                      //       shape: MaterialStateProperty.all<
                      //           RoundedRectangleBorder>(
                      //         RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(15),
                      //           side: BorderSide(
                      //             width: 2.0,
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     child: Text('Login'),
                      //     onPressed: () {},
                      //   ),
                      // )
                    ],
                  ),
                ],
              ),
            ),
            listTile(
                icon: Icons.restaurant_menu_outlined,
                title: "Menu",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MenuScreen(),
                    ),
                  );
                }),
            listTile(
                icon: Icons.shopping_cart_outlined,
                title: "Review Cart",
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ReviewCart()));
                }),
            listTile(
                icon: Icons.bookmark_add_outlined,
                title: "Reservation",
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Reservation()));
                }),
            listTile(
                icon: Icons.favorite_outline,
                title: "Wishlist",
                onPressed: () {
                  {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WishList(),
                      ),
                    );
                  }
                }),
            listTile(
                icon: Icons.table_restaurant_outlined,
                title: "Tables",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Tables(),
                    ),
                  );
                }),
            listTile(
                icon: Icons.star_outline,
                title: "Ratings & Review",
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Review()));
                }),
            // listTile(
            //     icon: Icons.copy_outlined,
            //     title: "Raise a Complain",
            //     onPressed: () {}),
            listTile(
                icon: Icons.format_quote_outlined,
                title: "FAQs",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FAQ(),
                    ),
                  );
                }),
            listTile(
                icon: Icons.person_outline,
                title: "My Profile",
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyProfile(),
                    ),
                  );
                }),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Call us:"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("+921111111111")
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text("Mail us:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("haris\'skitchen@gmail.com")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

listTile(
    {required IconData icon,
    required String title,
    required Function() onPressed}) {
  return ListTile(
    onTap: onPressed,
    leading: Icon(
      icon,
      size: 32,
      color: textcolor,
    ),
    title: Text(
      title,
      style: TextStyle(color: textcolor),
    ),
  );
}
