// import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:haris_kitchen/provider/internet_provider.dart';
import 'package:haris_kitchen/provider/sign_in_provider.dart';
import 'package:haris_kitchen/screens/drawer_screens/my_profile.dart';
import 'package:haris_kitchen/utils/config.dart';
import 'package:haris_kitchen/utils/next_screen.dart';
import 'package:haris_kitchen/utils/snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../screens/menu/menu_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  // final RoundedLoadingButtonController facebookController =
  //     RoundedLoadingButtonController();
  // final RoundedLoadingButtonController twitterController =
  // RoundedLoadingButtonController();
  // final RoundedLoadingButtonController phoneController =
  // RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('images/background.png'))),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 550,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 135),
                    Image.asset(
                      'images/logo.png',
                      height: 150,
                      width: 150,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Sign in to continue",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    RoundedLoadingButton(
                      onPressed: () {
                        handleGoogleSignIn();
                      },
                      controller: googleController,
                      successColor: Colors.red,
                      width: MediaQuery.of(context).size.width * 0.80,
                      elevation: 0,
                      borderRadius: 25,
                      color: Colors.red,
                      child: Wrap(
                        children: const [
                          Icon(
                            FontAwesomeIcons.google,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text("Sign in with Google",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // facebook login button
                    // RoundedLoadingButton(
                    //   onPressed: () {
                    //     handleFacebookAuth();
                    //   },
                    //   controller: facebookController,
                    //   successColor: Colors.blue,
                    //   width: MediaQuery.of(context).size.width * 0.80,
                    //   elevation: 0,
                    //   borderRadius: 25,
                    //   color: Colors.blue,
                    //   child: Wrap(
                    //     children: const [
                    //       Icon(
                    //         FontAwesomeIcons.facebook,
                    //         size: 20,
                    //         color: Colors.white,
                    //       ),
                    //       SizedBox(
                    //         width: 15,
                    //       ),
                    //       Text("Sign in with Facebook",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 15,
                    //               fontWeight: FontWeight.w500)),
                    //     ],
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // SizedBox(height: 10),
                    // Text(
                    //   'Sign in to continue',
                    //   style: TextStyle(color: Colors.white, fontSize: 20),
                    // ),
                    // // SizedBox(height: 10),
                    // Column(
                    //   children: [
                    //     SignInButton(
                    //       Buttons.Facebook,
                    //       text: "Sign in with Facebook",
                    //       onPressed: () {},
                    //     ),
                    //     SignInButton(Buttons.Google, text: "Sign in with Google",
                    //         onPressed: () {
                    //       handleGoogleSignIn();
                    //     }),
                    //   ],
                    // ),
                    // SizedBox(height: 10),
                    Column(
                      children: [
                        Text(
                          'By signing in you are agreeing to our',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Terms and Privacy Policy',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
      googleController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          googleController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // Future handleFacebookAuth() async {
  //   final sp = context.read<SignInProvider>();
  //   final ip = context.read<InternetProvider>();
  //   await ip.checkInternetConnection();
  //
  //   if (ip.hasInternet == false) {
  //     openSnackbar(context, "Check your Internet connection", Colors.red);
  //     facebookController.reset();
  //   } else {
  //     await sp.signInWithFacebook().then((value) {
  //       if (sp.hasError == true) {
  //         openSnackbar(context, sp.errorCode.toString(), Colors.red);
  //         facebookController.reset();
  //       } else {
  //         // checking whether user exists or not
  //         sp.checkUserExists().then((value) async {
  //           if (value == true) {
  //             // user exists
  //             await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
  //                 .saveDataToSharedPreferences()
  //                 .then((value) => sp.setSignIn().then((value) {
  //                       facebookController.success();
  //                       handleAfterSignIn();
  //                     })));
  //           } else {
  //             // user does not exist
  //             sp.saveDataToFirestore().then((value) => sp
  //                 .saveDataToSharedPreferences()
  //                 .then((value) => sp.setSignIn().then((value) {
  //                       facebookController.success();
  //                       handleAfterSignIn();
  //                     })));
  //           }
  //         });
  //       }
  //     });
  //   }
  // }

  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      nextScreenReplace(context, const MenuScreen());
    });
  }
}
