class ProductModel {
  String productName;
  String productImage;
  int productPrice;
  var productAbout;
  String? productId;
  int? productQuantity;
  ProductModel(
      {required this.productImage,
      required this.productName,
      required this.productPrice,
      this.productAbout,
      this.productId,
      this.productQuantity});
}
