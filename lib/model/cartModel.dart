// ignore_for_file: file_names

class CartModel {
  String itemPrice;
  String itemName;
  String itemCount;
  String itemImage;

  CartModel(
      {this.itemCount = '',
      this.itemImage = '',
      this.itemName = '',
      this.itemPrice = ''});
}

class CartData {
  String itemPrice;
  String uid;
  String itemName;
  String itemCount;
  String itemImage;

  CartData(
      {this.itemCount = '',
      this.itemImage = '',
      this.uid='',
      this.itemName = '',
      this.itemPrice = ''});
}
