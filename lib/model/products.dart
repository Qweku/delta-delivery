// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductModel {
  String prodImage;
  String prodName;
  String prodPrice;
  String unitPrice;
  String prodCount;
  String pid;
  Color prodColor;

  ProductModel(
      {this.prodImage = '',
      this.prodName = '',
      this.prodPrice = '',
      this.unitPrice ='',
      this.pid = '',
      this.prodCount='',
      this.prodColor = Colors.transparent});

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      prodName: map['name'],
      prodImage: map['image'],
      pid: map['pid'],
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
      "pid":'1',
      "price": '17.00',
      "color": Color(0xFF66BB6A),
    },
    {
      "name": 'Gino Tomato Paste',
      "image": 'assets/gino.png',
      "pid":'2',
      "price": '3.00',
      "color": Color(0xFFEF5350),
    },
    {
      "name": 'Peak Powdered Milk',
      "image": 'assets/peak2.png',
      "pid":'3',
      "price": '25.00',
      "color": Color(0xFF90CAF9),
    },
    {
      "name": 'Ideal Milk',
      "image": 'assets/ideal-milk.png',
      "pid":'4',
      "price": '4.00',
      "color": Color(0xFFFFF176),
    },
    {
      "name": 'Pomo Tomato Paste',
      "image": 'assets/pomo.png',
      "pid":'5',
      "price": '3.00',
      "color": Color(0xFFEF5350),
    },
    {
      "name": 'Titus Sardine',
      "image": 'assets/sardine.png',
      "pid":'6',
      "price": '4.00',
      "color": Color(0xFFFFCA28),
    },
    {
      "name": 'Peak Milk',
      "image": 'assets/peak_green.png',
      "pid":'7',
      "price": '3.50',
      "color": Color(0xFF9CCC65),
    }
  ];
  List<Map<String, dynamic>> drinks = [
    {
      "name": 'Coca Cola',
      "image": 'assets/coca-cola.png',
      "pid":'01',
      "price": '10.00',
      "color": Color(0xFF424242),
    },
    {
      "name": 'Hollandia Yogurt',
      "image": 'assets/hollandia.png',
      "pid":'02',
      "price": '20.00',
      "color": Color(0xFFEC407A),
    },
    {
      "name": 'Red Bull Energy Drink',
      "image": 'assets/red-bull.png',
      "pid":'03',
      "price": '3.00',
      "color": Color(0xFF1976D2),
    },
    {
      "name": 'Malta Guinness',
      "image": 'assets/malt.png',
      "pid":'04',
      "price": '4.00',
      "color": Color(0xFFFFC107),
    },
    {
      "name": 'Ceres Fruit Drink',
      "image": 'assets/ceres.png',
      "pid":'05',
      "price": '12.00',
      "color": Color(0xFFB2FF59),
    },
  ];
  List<Map<String, dynamic>> electronics = [
    {
      "name": 'Blender',
      "image": 'assets/blender.png',
      "pid":'001',
      "price": '100.00',
      "color": Color(0xFF616161),
    },
    {
      "name": 'Pressing Iron',
      "image": 'assets/iron.png',
      "pid":'002',
      "price": '150.00',
      "color": Color(0xFFFF80AB),
    },
    {
      "name": 'Microwave Oven',
      "image": 'assets/microwave.png',
      "pid":'003',
      "price": '300.00',
      "color": Color(0xFF90A4AE),
    },
    {
      "name": 'Cooking Stove',
      "image": 'assets/stove.png',
      "pid":'004',
      "price": '500.00',
      "color": Color(0xFF424242),
    },
    {
      "name": 'LED Television',
      "image": 'assets/television.png',
      "pid":'005',
      "price": '1280.00',
      "color": Color(0xFFCE93D8),
    },
    {
      "name": 'Washing Machine',
      "image": 'assets/washing-machine.png',
      "pid":'006',
      "price": '1150.00',
      "color": Color(0xFF616161),
    },
  ];
}
