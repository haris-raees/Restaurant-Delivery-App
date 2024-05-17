import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/models/product_model.dart';
import '../../utils/single_item.dart';

class Search extends StatefulWidget {
  const Search({Key? key, this.search}) : super(key: key);
  final List<ProductModel>? search;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";
  searchItem(String query) {
    List<ProductModel> seacrhFood = widget.search!.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return seacrhFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      backgroundColor: Scaffoldbackgroundcolour,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textcolor),
        backgroundColor: primarycolour,
        title: Text(
          "Search",
          style: TextStyle(color: textcolor),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Items",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            height: 52,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Color(0xffc2c2c2),
                  filled: true,
                  hintText: "Search for items in the store",
                  suffixIcon: Icon(Icons.search)),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                isBool: false,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
              );
            }).toList(),
          ),

          // SingleItem(isBool: false),
          // SingleItem(isBool: false),
          // SingleItem(isBool: false),
          // SingleItem(isBool: false),
        ],
      ),
    );
  }
}
