import 'package:haris_kitchen/auth/sign_in.dart';
import 'package:haris_kitchen/screens/drawer_screens/my_profile/my_orders.dart';
import 'package:haris_kitchen/utils/next_screen.dart';
import 'package:provider/provider.dart';
import 'package:haris_kitchen/provider/sign_in_provider.dart';
import 'package:flutter/material.dart';

import '../Drawer_side.dart';
import '../../utils/colors.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
    return Scaffold(
      backgroundColor: Scaffoldbackgroundcolour,
      drawer: DrawerSide(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: primarycolour,
        elevation: 0.0,
        title: Text(
          "My Profile",
          style: TextStyle(fontSize: 18, color: textcolor),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 100,
                color: Scaffoldbackgroundcolour,
              ),
              Container(
                height: 548,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    color: primarycolour,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          height: 80,
                          padding: EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome ${sp.name}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: textcolor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("${sp.email}"),
                                  Text("${sp.provider}".toUpperCase(),
                                      style: const TextStyle(color: Colors.red))
                                ],
                              ),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: primarycolour,
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    color: primarycolour,
                                  ),
                                  backgroundColor: Scaffoldbackgroundcolour,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    listTile(
                        icon: Icons.shop_outlined,
                        title: "My Orders",
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => MyOrder(),
                            ),
                          );
                        }),
                    listTile(
                        icon: Icons.location_on_outlined,
                        title: "My Deliver Address",
                        onPressed: () {}),
                    listTile(
                        icon: Icons.person_outline_outlined,
                        title: "Refer A Friends",
                        onPressed: () {}),
                    listTile(
                        icon: Icons.file_copy_outlined,
                        title: "Terms & Conditions",
                        onPressed: () {}),
                    listTile(
                        icon: Icons.policy_outlined,
                        title: "Privacy Policy",
                        onPressed: () {}),
                    listTile(
                        icon: Icons.add_chart_outlined,
                        title: "About",
                        onPressed: () {}),
                    listTile(
                        icon: Icons.exit_to_app_outlined,
                        title: "Log Out",
                        onPressed: () {
                          sp.userSignOut();
                          nextScreenReplace(context, const LoginScreen());
                        }),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primarycolour,
              child: CircleAvatar(
                backgroundImage: NetworkImage("${sp.imageUrl}"),
                radius: 45,
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

listTile({
  required IconData icon,
  required String title,
  required Function() onPressed,
}) {
  return Column(
    children: [
      Divider(
        height: 1,
      ),
      ListTile(
        onTap: onPressed,
        leading: Icon(icon),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios),
      )
    ],
  );
}

// class MyProfile extends StatefulWidget {
//   const MyProfile({Key? key}) : super(key: key);
//
//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }
//
// class _MyProfileState extends State<MyProfile> {
//   Future getData() async {
//     final sp = context.read<SignInProvider>();
//     sp.getDataFromSharedPreferences();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // change read to watch!!!!
//     final sp = context.watch<SignInProvider>();
//     return Scaffold(
//       backgroundColor: Scaffoldbackgroundcolour,
//       drawer: DrawerSide(),
//       appBar: AppBar(
//         elevation: 0.0,
//         title: Text(
//           "My Profile",
//           style: TextStyle(fontSize: 18, color: textcolor),
//         ),
//       ),
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Container(
//                 height: 100,
//                 color: primarycolour,
//               ),
//               Container(
//                 height: 548,
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                 decoration: BoxDecoration(
//                     color: primarycolour,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(30),
//                         topRight: Radius.circular(30))),
//                 child: ListView(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Container(
//                           width: 250,
//                           height: 80,
//                           padding: EdgeInsets.only(left: 20),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Welcome ${sp.name}",
//                                     style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                         color: textcolor),
//                                   ),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   Text("${sp.email}"),
//                                 ],
//                               ),
//                               CircleAvatar(
//                                 radius: 15,
//                                 backgroundColor: primarycolour,
//                                 child: CircleAvatar(
//                                   radius: 12,
//                                   child: Icon(
//                                     Icons.edit,
//                                     color: primarycolour,
//                                   ),
//                                   backgroundColor: Scaffoldbackgroundcolour,
//                                 ),
//                               )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     listTile(icon: Icons.shop_outlined, title: "My Orders"),
//                     listTile(
//                         icon: Icons.shop_outlined, title: "My Deliver Address"),
//                     listTile(
//                         icon: Icons.shop_outlined, title: "Refer A Friends"),
//                     listTile(
//                         icon: Icons.shop_outlined, title: "Terms & Conditions"),
//                     listTile(
//                         icon: Icons.shop_outlined, title: "Privacy Policy"),
//                     listTile(icon: Icons.shop_outlined, title: "About"),
//                     listTile(icon: Icons.shop_outlined, title: "Log Out"),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 40, left: 30),
//             child: CircleAvatar(
//               radius: 50,
//               backgroundColor: primarycolour,
//               child: CircleAvatar(
//                 backgroundImage: NetworkImage("${sp.imageUrl}"),
//                 radius: 45,
//                 backgroundColor: Colors.white,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// listTile({
//   required IconData icon,
//   required String title,
// }) {
//   return Column(
//     children: [
//       Divider(
//         height: 1,
//       ),
//       ListTile(
//         leading: Icon(icon),
//         title: Text(title),
//         trailing: Icon(Icons.arrow_forward_ios),
//       )
//     ],
//   );
// }

//
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             CircleAvatar(
//               backgroundColor: Colors.white,
//               backgroundImage: NetworkImage("${sp.imageUrl}"),
//               radius: 50,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Welcome ${sp.name}",
//               style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               "${sp.email}",
//               style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Text(
//               "${sp.uid}",
//               style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("PROVIDER:"),
//                 const SizedBox(
//                   width: 5,
//                 ),
//                 Text("${sp.provider}".toUpperCase(),
//                     style: const TextStyle(color: Colors.red)),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   sp.userSignOut();
//                   nextScreenReplace(context, const LoginScreen());
//                 },
//                 child: const Text("SIGNOUT",
//                     style: TextStyle(
//                       color: Colors.white,
//                     )))
//           ],
//         ),
//       ),
//     );
//   }
// }
