class DeliveryAddressModel {
  String firstName;
  String lastName;
  String mobileNumber;
  String alternateMobileNumber;
  String society;
  String street;
  String landMark;
  String city;
  String area;
  String pinCode;
  String addressType;

  DeliveryAddressModel(
      {required this.firstName,
      required this.lastName,
      required this.mobileNumber,
      required this.alternateMobileNumber,
      required this.society,
      required this.street,
      required this.landMark,
      required this.city,
      required this.area,
      required this.pinCode,
      required this.addressType});
}
