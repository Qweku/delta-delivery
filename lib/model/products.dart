// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductModel {
  String prodImage;
  String prodName;
  String prodPrice;
  String unitPrice;
  String prodCount;
  Color prodColor;

  ProductModel(
      {this.prodImage = '',
      this.prodName = '',
      this.prodPrice = '',
      this.unitPrice ='',
      this.prodCount='',
      this.prodColor = Colors.transparent});

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      prodName: map['name'],
      prodImage: map['image'],
      prodPrice: map['price'],
      prodColor: map['color'],
    );
  }

  List<ProductModel> productModelList(List<Map<String, dynamic>> str) =>
      List<ProductModel>.from(str.map((x) => ProductModel.fromMap(x)));

  List<Map<String, dynamic>> canned = [
    {
      "name": 'Nestle Milo',
      "image": 'assets/milo.png',
      "price": '17.00',
      "color": Color(0xFF66BB6A),
    },
    {
      "name": 'Gino Tomato Paste',
      "image": 'assets/gino.png',
      "price": '3.00',
      "color": Color(0xFFEF5350),
    },
    {
      "name": 'Peak Powdered Milk',
      "image": 'assets/peak2.png',
      "price": '25.00',
      "color": Color(0xFF90CAF9),
    },
    {
      "name": 'Ideal Milk',
      "image": 'assets/ideal-milk.png',
      "price": '4.00',
      "color": Color(0xFFFFF176),
    },
    {
      "name": 'Pomo Tomato Paste',
      "image": 'assets/pomo.png',
      "price": '3.00',
      "color": Color(0xFFEF5350),
    },
    {
      "name": 'Titus Sardine',
      "image": 'assets/sardine.png',
      "price": '4.00',
      "color": Color(0xFFFFCA28),
    },
    {
      "name": 'Peak Milk',
      "image": 'assets/peak_green.png',
      "price": '3.50',
      "color": Color(0xFF9CCC65),
    }
  ];
  List<Map<String, dynamic>> drinks = [
    {
      "name": 'Coca Cola',
      "image": 'assets/coca-cola.png',
      "price": '10.00',
      "color": Color(0xFF424242),
    },
    {
      "name": 'Hollandia Yogurt',
      "image": 'assets/hollandia.png',
      "price": '20.00',
      "color": Color(0xFFEC407A),
    },
    {
      "name": 'Red Bull Energy Drink',
      "image": 'assets/red-bull.png',
      "price": '3.00',
      "color": Color(0xFF1976D2),
    },
    {
      "name": 'Malta Guinness',
      "image": 'assets/malt.png',
      "price": '4.00',
      "color": Color(0xFFFFC107),
    },
    {
      "name": 'Ceres Fruit Drink',
      "image": 'assets/ceres.png',
      "price": '12.00',
      "color": Color(0xFFB2FF59),
    },
  ];
  List<Map<String, dynamic>> electronics = [
    {
      "name": 'Blender',
      "image": 'assets/blender.png',
      "price": '100.00',
      "color": Color(0xFF616161),
    },
    {
      "name": 'Pressing Iron',
      "image": 'assets/iron.png',
      "price": '150.00',
      "color": Color(0xFFFF80AB),
    },
    {
      "name": 'Microwave Oven',
      "image": 'assets/microwave.png',
      "price": '300.00',
      "color": Color(0xFF90A4AE),
    },
    {
      "name": 'Cooking Stove',
      "image": 'assets/stove.png',
      "price": '500.00',
      "color": Color(0xFF424242),
    },
    {
      "name": 'LED Television',
      "image": 'assets/television.png',
      "price": '1280.00',
      "color": Color(0xFFCE93D8),
    },
    {
      "name": 'Washing Machine',
      "image": 'assets/washing-machine.png',
      "price": '1150.00',
      "color": Color(0xFF616161),
    },
  ];
}
