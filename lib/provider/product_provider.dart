import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../utils/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;
  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
        productImage: element.get("productImage"),
        productName: element.get("productName"),
        productPrice: element.get("productPrice"),
        productAbout: element.get("productAbout"),
        productId: element.get("productId"));
    search.add(productModel);
  }

  List<ProductModel> burgersProductList = [];
  fetchBurgersProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("BurgersProduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    burgersProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getBurgersProductDataList {
    return burgersProductList;
  }

  List<ProductModel> pizzasProductList = [];
  fetchPizzasProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("PizzasProduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    pizzasProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getPizzasProductDataList {
    return pizzasProductList;
  }

  List<ProductModel> drinksProductList = [];
  fetchDrinksProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("DrinksProduct").get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel);
    });
    drinksProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getDrinksProductDataList {
    return drinksProductList;
  }

  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
