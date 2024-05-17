import 'package:flutter/material.dart';
import 'package:haris_kitchen/screens/menu/search_screen.dart';
import 'package:haris_kitchen/provider/product_provider.dart';
import 'package:haris_kitchen/utils/signal_product.dart';
import 'package:haris_kitchen/screens/Drawer_side.dart';
import 'package:provider/provider.dart';

import '../drawer_screens/my_profile.dart';
import '../../product_overview/product_overview.dart';
import '../../utils/colors.dart';
import '../drawer_screens/review_cart.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late ProductProvider productProvider;
  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchBurgersProductData();
    productProvider.fetchPizzasProductData();
    productProvider.fetchDrinksProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    return Scaffold(
        backgroundColor: Scaffoldbackgroundcolour,
        drawer: DrawerSide(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: textcolor),
          // leading: Icon(Icons.menu, color: Colors.black),
          title: Text(
            'Menu',
            style: TextStyle(color: textcolor, fontSize: 20),
          ),
          backgroundColor: primarycolour,
          actions: [
            // CircleAvatar(
            //   radius: 15,
            //   backgroundColor: Color(0xffd6d382),
            // ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        Search(search: productProvider.getAllProductSearch),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: 20,
                color: textcolor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ),
                  );
                },
                // child: CircleAvatar(
                //   backgroundColor: Color(0xffd6d382),
                //   radius: 15,
                // ),
                child: Icon(
                  Icons.shop,
                  size: 20,
                  color: textcolor,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView(children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/cover.jpg"),
                  ),
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 200, top: 70),
                          child: Column(
                            children: [
                              Text(
                                '30% Off',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 20),
                              //   child:
                              Text(
                                'On all food products',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Burgers',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Search(
                                search:
                                    productProvider.getBurgersProductDataList),
                          ),
                        );
                      },
                      child: Text(
                        "view all",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.getBurgersProductDataList.map(
                    (burgersProductData) {
                      return SingalProducts(
                          productImage: burgersProductData.productImage,
                          // 'images/burgers/burger1.png',
                          productName: burgersProductData.productName,
                          productPrice: burgersProductData.productPrice,
                          productId: burgersProductData.productId,
                          // "Cheese Burger",
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ProductOverview(
                                        productName:
                                            burgersProductData.productName,
                                        productId: burgersProductData.productId,
                                        // "Cheese Burger",
                                        productImage:
                                            burgersProductData.productImage,
                                        // "images/burgers/burger1.png",
                                        productAbout:
                                            burgersProductData.productAbout,
                                        // "A cheeseburger is a hamburger topped with cheese. Traditionally, the slice of cheese is placed on top of the meat patty. The cheese is usually added to the cooking hamburger patty shortly before serving, which allows the cheese to melt. Cheeseburgers can include variations in structure, ingredients and composition.",
                                        productPrice:
                                            burgersProductData.productPrice,
                                      )),
                            );
                          });
                    },
                  ).toList(),
                  // children: [

                  //   SingalProducts(
                  //       productImage: 'images/burgers/burger2.png',
                  //       productName: "Patty Burger",
                  //       onTap: () {
                  //         Navigator.of(context).push(
                  //           MaterialPageRoute(
                  //               builder: (context) => ProductOverview(
                  //                     productName: "Patty Burger",
                  //                     productImage: "images/burgers/burger2.png",
                  //                     productAbout:
                  //                         "A patty or burger (in British English) is a flattened, usually round, serving of ground meat and/or legumes, grains, vegetables, or meat alternatives. Patties are found in multiple cuisines throughout the world.",
                  //                   )),
                  //         );
                  //       }),
                  //   SingalProducts(
                  //       productImage: 'images/burgers/burger3.png',
                  //       productName: "Double Patty Burger",
                  //       onTap: () {
                  //         Navigator.of(context).push(
                  //           MaterialPageRoute(
                  //               builder: (context) => ProductOverview(
                  //                     productName: "Double Patty Burger",
                  //                     productImage: "images/burgers/burger3.png",
                  //                     productAbout:
                  //                         "A double patty burger (in British English) is a flattened, usually round, serving of ground meat and/or legumes, grains, vegetables, or meat alternatives. Patties are found in multiple cuisines throughout the world.",
                  //                   )),
                  //         );
                  //       }),
                  //   SingalProducts(
                  //       productImage: 'images/burgers/burger4.png',
                  //       productName: "Triple Patty Burger",
                  //       onTap: () {
                  //         Navigator.of(context).push(
                  //           MaterialPageRoute(
                  //               builder: (context) => ProductOverview(
                  //                     productName: "Triple Patty Burger",
                  //                     productImage: "images/burgers/burger4.png",
                  //                     productAbout:
                  //                         "A tripple patty burger (in British English) is a flattened, usually round, serving of ground meat and/or legumes, grains, vegetables, or meat alternatives. Patties are found in multiple cuisines throughout the world.",
                  //                   )),
                  //         );
                  //       }),
                  //   SingalProducts(
                  //       productImage: ' ',
                  //       productName: "Grill Burger",
                  //       onTap: () {
                  //         Navigator.of(context).push(
                  //           MaterialPageRoute(
                  //               builder: (context) => ProductOverview(
                  //                     productName: "Grill Burger",
                  //                     productImage: "images/burgers/burger5.png",
                  //                     productAbout:
                  //                         "Flavor, relish, savor, smack, zest, tanginess, piquancy, nip, all those words can be written in place of tang. Bland or dull food is just the opposite. Tart sharp, sharp-tasting that is, bitter, acid or acidic, harsh, sour taste, just like a lemon.",
                  //                   )),
                  //         );
                  //       }),
                  // ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pizzas',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Search(
                                search:
                                    productProvider.getPizzasProductDataList),
                          ),
                        );
                      },
                      child: Text(
                        "view all",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.getPizzasProductDataList.map(
                    (pizzasProductData) {
                      return SingalProducts(
                          productImage: pizzasProductData.productImage,
                          // 'images/burgers/burger1.png',
                          productName: pizzasProductData.productName,
                          productPrice: pizzasProductData.productPrice,
                          productId: pizzasProductData.productId,
                          // "Cheese Burger",
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ProductOverview(
                                        productName:
                                            pizzasProductData.productName,
                                        productId: pizzasProductData.productId,

                                        // "Cheese Burger",
                                        productImage:
                                            pizzasProductData.productImage,
                                        // "images/burgers/burger1.png",
                                        productAbout:
                                            pizzasProductData.productAbout,
                                        // "A cheeseburger is a hamburger topped with cheese. Traditionally, the slice of cheese is placed on top of the meat patty. The cheese is usually added to the cooking hamburger patty shortly before serving, which allows the cheese to melt. Cheeseburgers can include variations in structure, ingredients and composition.",
                                        productPrice:
                                            pizzasProductData.productPrice,
                                      )),
                            );
                          });
                    },
                  ).toList(),
                ),
              ),
              //       SingalProducts(
              //           productImage: 'images/pizzas/pizza1.png',
              //           productName: "Pepperoni Pizza",
              //           onTap: () {
              //             Navigator.of(context).push(
              //               MaterialPageRoute(
              //                   builder: (context) => ProductOverview(
              //                         productName: "Pepperoni Pizza",
              //                         productImage: "images/pizzas/pizza1.png",
              //                         productAbout:
              //                             "Pepperoni pizza is an American pizza variety which includes one of the country's most beloved toppings. Pepperoni is actually a corrupted form of peperoni (one “p”), which denotes a large pepper in Italian, but nowadays it denotes a spicy salami, usually made with a mixture of beef, pork, and spices.",
              //                       )),
              //             );
              //           }),
              //       SingalProducts(
              //           productImage: 'images/pizzas/pizza2.png',
              //           productName: "Tomato Pizza",
              //           onTap: () {
              //             Navigator.of(context).push(
              //               MaterialPageRoute(
              //                   builder: (context) => ProductOverview(
              //                         productName: "Tomato Pizza",
              //                         productImage: "images/pizzas/pizza2.png",
              //                         productAbout:
              //                             "The lack of cheese isn't the only major difference between tomato pie pizza and regular pizza, the shape also differs. Typically speaking, tomato pie pizza is baked in a rectangular shape. The rectangular pizza dough is topped with chopped tomatoes or a thick pizza sauce, and a light sprinkle of Parmesan cheese",
              //                       )),
              //             );
              //           }),
              //       SingalProducts(
              //           productImage: 'images/pizzas/pizza3.png',
              //           productName: "Supreme Pizza",
              //           onTap: () {
              //             Navigator.of(context).push(
              //               MaterialPageRoute(
              //                   builder: (context) => ProductOverview(
              //                         productName: "Supreme Pizza",
              //                         productImage: "images/pizzas/pizza3.png",
              //                         productAbout:
              //                             "The common denominator seems to be a hearty combination of both meat and vegetable toppings, with at least two kinds of each represented. The supreme title stems from the sheer amount and variety of toppings included. Keep this in mind when you order a supreme pizza – they vary from pizzeria to pizzeria.",
              //                       )),
              //             );
              //           }),
              //       SingalProducts(
              //           productImage: 'images/pizzas/pizza4.png',
              //           productName: "Cheese Pizza",
              //           onTap: () {
              //             Navigator.of(context).push(
              //               MaterialPageRoute(
              //                   builder: (context) => ProductOverview(
              //                         productName: "Cheese Pizza",
              //                         productImage: "images/pizzas/pizza4.png",
              //                         productAbout:
              //                             "Although a Margherita pizza is technically a cheese pizza, a 'regular cheese pizza' is a more basic meal with just tomato sauce topped with cheese. Typically a cheese pizza will also use mozzarella but other cheeses such as parmesan may also be mixed in the toppings.",
              //                       )),
              //             );
              //           }),
              //       SingalProducts(
              //           productImage: 'images/pizzas/pizza5.png',
              //           productName: "Beef Pizza",
              //           onTap: () {
              //             Navigator.of(context).push(
              //               MaterialPageRoute(
              //                   builder: (context) => ProductOverview(
              //                         productName: "Beef Pizza",
              //                         productImage: "images/pizzas/pizza5.png",
              //                         productAbout:
              //                             "If you love pizza in all it's bready and cheesy glory, but still find yourself hungry for something more substantial, then chances are you'll be a fan of meat lover's pizza. Most pizzerias offer some kind of extra meaty option on their menus for true carnivores who are looking for more than simple slices of pepperoni.",
              //                       )),
              //             );
              //           }),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Drinks',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Search(
                                search:
                                    productProvider.getDrinksProductDataList),
                          ),
                        );
                      },
                      child: Text(
                        "view all",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.getDrinksProductDataList.map(
                    (drinksProductData) {
                      return SingalProducts(
                          productImage: drinksProductData.productImage,
                          // 'images/burgers/burger1.png',
                          productName: drinksProductData.productName,
                          productPrice: drinksProductData.productPrice,
                          productId: drinksProductData.productId,
                          // "Cheese Burger",
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ProductOverview(
                                        productName:
                                            drinksProductData.productName,
                                        productId: drinksProductData.productId,

                                        // "Cheese Burger",
                                        productImage:
                                            drinksProductData.productImage,
                                        // "images/burgers/burger1.png",
                                        productAbout:
                                            drinksProductData.productAbout,
                                        // "A cheeseburger is a hamburger topped with cheese. Traditionally, the slice of cheese is placed on top of the meat patty. The cheese is usually added to the cooking hamburger patty shortly before serving, which allows the cheese to melt. Cheeseburgers can include variations in structure, ingredients and composition.",
                                        productPrice:
                                            drinksProductData.productPrice,
                                      )),
                            );
                          });
                    },
                  ).toList(),
                ),
                // children: [
                //   SingalProducts(
                //     productImage: "images/drinks/drink1.png",
                //     productPrice: 50,
                //     productName: "Pepsi 50ml",
                //     onTap: () {
                //       Navigator.of(context).push(
                //         MaterialPageRoute(
                //             builder: (context) => ProductOverview(
                //                   productName: "Pepsi 50ml",
                //                   productPrice: 50,
                //                   productImage:
                //                       "images/drinks/drink1.png",
                //                   productAbout:
                //                       "Pepsi is a carbonated soft drink manufactured by PepsiCo. Originally created and developed in 1893 by Caleb Bradham and introduced as Brad's Drink, it was renamed as Pepsi-Cola in 1898, and then shortened to Pepsi in 1961.",
                //                 )),
                //       );
                //     },
                //   ),
                //   SingalProducts(
                //       productImage: 'images/drinks/drink2.png',
                //       productPrice: 50,
                //       productName: "Coca Cola 50ml",
                //       onTap: () {
                //         Navigator.of(context).push(
                //           MaterialPageRoute(
                //               builder: (context) => ProductOverview(
                //                     productPrice: 50,
                //                     productName: "Coca Cola 50ml",
                //                     productImage:
                //                         "images/drinks/drink2.png",
                //                     productAbout:
                //                         "The Coca-Cola Co. is the nonalcoholic beverage company, which engages in the manufacture, market, and sale of non-alcoholic beverages which include sparkling soft drinks, water, enhanced water and sports drinks, juice, dairy and plant-based beverages, tea and coffee and energy drinks.",
                //                   )),
                //         );
                //       }),
                //   SingalProducts(
                //       productPrice: 50,
                //       productImage: 'images/drinks/drink3.png',
                //       productName: "Sprite 50ml",
                //       onTap: () {
                //         Navigator.of(context).push(
                //           MaterialPageRoute(
                //               builder: (context) => ProductOverview(
                //                     productPrice: 50,
                //                     productName: "Sprite 50ml",
                //                     productImage:
                //                         "images/drinks/drink3.png",
                //                     productAbout:
                //                         "Crisp, refreshing and clean-tasting, Sprite is a lemon and lime-flavoured soft drink. It first hit shop shelves back in 1961 and today it's sold in more than 190 countries. Crisp, refreshing and clean-tasting, Sprite is a lemon and lime-flavoured soft drink.",
                //                   )),
                //         );
                //       }),
                //   SingalProducts(
                //       productPrice: 50,
                //       productImage: 'images/drinks/drink4.png',
                //       productName: "Fanta 50ml",
                //       onTap: () {
                //         Navigator.of(context).push(
                //           MaterialPageRoute(
                //               builder: (context) => ProductOverview(
                //                     productPrice: 50,
                //                     productName: "Fanta 50ml",
                //                     productImage:
                //                         "images/drinks/drink4.png",
                //                     productAbout:
                //                         "Bright, bubbly and popular, Fanta is the soft drink that intensifies fun. Introduced in 1940, Fanta is the second oldest brand of The Coca-Cola Company. Bright, bubbly and popular, Fanta is the soft drink that intensifies fun.",
                //                   )),
                //         );
                //       }),
                //   SingalProducts(
                //       productPrice: 50,
                //       productImage: 'images/drinks/drink5.png',
                //       productName: "Red Bull 50ml",
                //       onTap: () {
                //         Navigator.of(context).push(
                //           MaterialPageRoute(
                //               builder: (context) => ProductOverview(
                //                     productPrice: 50,
                //                     productName: "Red Bull 50ml",
                //                     productImage:
                //                         "images/drinks/drink5.png",
                //                     productAbout:
                //                         "Red Bull is a utility drink to be taken against mental or physical weariness or exhaustion. Red Bull combines two natural substances and important metabolic transmitters - the amino acid taurine and the glucuronolactone - with stimulating caffeine, vitamins and the energy provided by carbohydrates.",
                //                   )),
                //         );
                //       }),
                // ])),
                // ]
              )
            ])));
    //   ),
    // );
  }
}
