import 'package:haris_kitchen/provider/check_out_provider.dart';
import 'package:haris_kitchen/provider/internet_provider.dart';
import 'package:haris_kitchen/provider/reservation_provider.dart';
import 'package:haris_kitchen/provider/review_cart_provider.dart';
import 'package:haris_kitchen/provider/review_provider.dart';
import 'package:haris_kitchen/provider/sign_in_provider.dart';
import 'package:haris_kitchen/provider/wish_list_provider.dart';
import 'package:haris_kitchen/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:haris_kitchen/provider/product_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // initialize the application
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => SignInProvider()),
        ),
        ChangeNotifierProvider(
          create: ((context) => InternetProvider()),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: ((context) => ProductProvider()),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: ((context) => ReviewCartProvider()),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: ((context) => WishListProvider()),
        ),
        ChangeNotifierProvider<CheckoutProvider>(
          create: ((context) => CheckoutProvider()),
        ),
        ChangeNotifierProvider<ReservationProvider>(
          create: ((context) => ReservationProvider()),
        ),
        ChangeNotifierProvider<ReviewProvider>(
          create: ((context) => ReviewProvider()),
        ),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
