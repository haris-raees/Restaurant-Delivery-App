import 'dart:async';

import 'package:haris_kitchen/provider/sign_in_provider.dart';
import 'package:haris_kitchen/screens/drawer_screens/my_profile.dart';
import 'package:haris_kitchen/auth/sign_in.dart';
import 'package:haris_kitchen/utils/config.dart';
import 'package:haris_kitchen/utils/next_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'drawer_screens/review_cart.dart';
import 'menu/menu_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    // create a timer of 2 seconds
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
          ? nextScreen(context, const LoginScreen())
          : nextScreen(context, const MenuScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Center(
            child: Image(
          image: AssetImage('images/logo.png'),
          height: 120,
          width: 120,
        )),
      ),
    );
  }
}
