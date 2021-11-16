// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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
  int itemCount;
  String itemImage;
  Color? itemColor;

  CartData(
      {this.itemCount = 0,
      this.itemImage = '',
      this.uid = '',
      this.itemName = '',
      this.itemColor ,
      this.itemPrice = ''});
}

class Carts with ChangeNotifier {
  Map<String, CartData> _items = {};

  Map<String, CartData> get items {
    return {..._items};
  }

  int get itemsCount {
    return _items.length;
  }

  void addItem(
      String prodId, String name, String img, String price, String count,Color itmColor) {
    if (_items.containsKey(prodId)) {
      _items.update(
          prodId,
          (existingCartItem) => CartData(
              uid: DateTime.now().toString(),
              itemName: existingCartItem.itemName,
              itemCount: existingCartItem.itemCount,
              itemPrice: existingCartItem.itemPrice,
              itemColor: existingCartItem.itemColor,
              itemImage: existingCartItem.itemImage));
    } else {
      _items.putIfAbsent(
          prodId,
          () => CartData(
              itemName: name,
              uid: DateTime.now().toString(),
              itemPrice: price,
              itemCount: int.parse(count),
              itemImage: img,
              itemColor:itmColor));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id]!.itemCount > 1) {
      _items.update(
          id,
          (existingCartItem) => CartData(
              uid: DateTime.now().toString(),
              itemName: existingCartItem.itemName,
              itemCount: existingCartItem.itemCount,
              itemPrice: existingCartItem.itemPrice,
              itemColor: existingCartItem.itemColor,
              itemImage: existingCartItem.itemImage));
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
