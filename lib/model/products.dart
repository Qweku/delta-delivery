// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductModel {
  String prodImage;
  String prodName;
  String prodPrice;
  Color prodColor;

  ProductModel(
      {this.prodImage = '',
      this.prodName = '',
      this.prodPrice = '',
      this.prodColor = Colors.transparent});

  List<String> productImages = [
    'assets/milo.png',
    'assets/gino.png',
    'assets/peak2.png',
    'assets/ideal-milk.png',
    'assets/pomo.png',
    'assets/sardine.png',
    'assets/peak_green.png',
  ];

  List<String> productName = [
    'Nestle Milo',
    'Gino Tomato Paste',
    'Peak Powdered Milk',
    'Ideal Milk',
    'Pomo Tomato Paste',
    'Titus Sardine',
    'Peak Milk'
  ];

  List<String> prices = [
    'GHS 17.00',
    'GHS 3.00',
    'GHS 25.00',
    'GHS 4.00',
    'GHS 2.50',
    'GHS 4.50',
    'GHS 3.00'
  ];

  List productColor = [
    Color(0xFF66BB6A),
    Color(0xFFEF5350),
    Color(0xFF90CAF9),
    Color(0xFFFFF176),
    Color(0xFFEF5350),
    Color(0xFFFFCA28),
    Color(0xFF9CCC65),
  ];

  //---------------------DRINKS DATA----------------------------------------------//

  List<String> drinkImages = [
    'assets/coca-cola.png',
    'assets/hollandia.png',
    'assets/red-bull.png',
    'assets/malt.png',
    'assets/ceres.png',
    
  ];

  List<String> drinkName = [
    'Coca Cola',
    'Hollandia Yogurt',
    'Red Bull Energy Drink',
    'Malta Guinness',
    'Ceres Fruit Drink',
    
  ];

  List<String> drinkPrices = [
    'GHS 10.00',
    'GHS 20.00',
    'GHS 5.00',
    'GHS 4.00',
    'GHS 12.0',
   
  ];

  List drinkColor = [
    Color(0xFF303030),
    Color(0xFFEC407A),
    Color(0xFF1976D2),
    Color(0xFFFFC107),
    Color(0xFFB2FF59),
    
  ];
}
