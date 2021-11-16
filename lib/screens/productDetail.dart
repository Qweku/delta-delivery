// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields

import 'package:delta/components/button.dart';
import 'package:delta/components/counter.dart';
import 'package:delta/model/cartModel.dart';
import 'package:delta/model/products.dart';
import 'package:delta/services/dataBase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import 'cart.dart';
import 'productSummary.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel products;
  final int? tag;
  const ProductDetailScreen({Key? key, this.tag, required this.products})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  TextEditingController _counterValue = TextEditingController();

  @override
  void initState() {
    _counterValue.text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final user = Provider.of<User?>(context);
    return Scaffold(
        backgroundColor: widget.products.prodColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: widget.products.prodColor,
          iconTheme: IconThemeData(color: theme.primaryColorLight),
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                        tag: 'productItem${widget.tag}',
                        child: Image.asset(
                          widget.products.prodImage,
                          height: height * 0.4,
                        )),
                    SizedBox(height: 20),
                    Text(widget.products.prodName,
                        style: theme.textTheme.headline4!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 35)),
                    SizedBox(height: 10),
                    Text('GHS ${widget.products.prodPrice}',
                        style: theme.textTheme.headline4)
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment(0, 0.85),
              child: Container(
                  height: height * 0.25,
                  width: width * 0.8,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Column(
                    children: [
                      CounterField(
                        width: width * 0.5,
                        controller: _counterValue,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Button(
                            borderColor: widget.products.prodColor,
                            buttonText: 'Add To Cart',
                            onTap: () async {
                              double _cPrice =
                                  double.parse(widget.products.prodPrice);
                              int _counter = int.parse(_counterValue.text);

                              double totalPrice = _cPrice * _counter;
                              totalPrice.toString();
                              await DbServices(uid: user!.uid).cartDataUpdate(
                                totalPrice.toString(),
                                widget.products.prodName,
                                _counterValue.text,
                                widget.products.prodImage,
                              );
                              // cartD!.itemName =
                              //     widget.products.prodName;
                              // cartD.itemImage =
                              //     widget.products.prodImage;
                              // cartD.itemPrice = totalPrice.toString();
                              // cartD.itemCount = _counterValue.text;
                              ProductModel productItems = ProductModel(
                                  prodColor: widget.products.prodColor,
                                  prodImage: widget.products.prodImage,
                                  prodName: widget.products.prodName,
                                  prodCount: _counterValue.text,
                                  prodPrice: totalPrice.toString());
                              if (_counterValue.text == '0') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: theme.primaryColorDark,
                                      content: Text('Invalid number of items',
                                          textAlign: TextAlign.center,
                                          style: theme.textTheme.bodyText2),
                                      duration: Duration(milliseconds: 1500),
                                      behavior: SnackBarBehavior.floating,
                                      shape: StadiumBorder()),
                                );
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CartScreen(
                                        products: productItems,
                                      ),
                                    ));
                              }
                            },
                            width: width * 0.3,
                            shadowColor: Colors.transparent,
                          ),
                          Button(
                            color: widget.products.prodColor,
                            buttonText: 'Buy Now',
                            onTap: () {
                              double _cPrice =
                                  double.parse(widget.products.prodPrice);
                              int _counter = int.parse(_counterValue.text);

                              double totalPrice = _cPrice * _counter;
                              totalPrice.toString();
                              ProductModel productItems = ProductModel(
                                  prodColor: widget.products.prodColor,
                                  prodImage: widget.products.prodImage,
                                  prodName: widget.products.prodName,
                                  prodCount: _counterValue.text,
                                  unitPrice: widget.products.prodPrice,
                                  prodPrice: totalPrice.toString());
                              if (_counterValue.text == '0') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: theme.primaryColorDark,
                                      content: Text('Invalid number of items',
                                          textAlign: TextAlign.center,
                                          style: theme.textTheme.bodyText2),
                                      duration: Duration(milliseconds: 1500),
                                      behavior: SnackBarBehavior.floating,
                                      shape: StadiumBorder()),
                                );
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductSummary(
                                          products: productItems),
                                    ));
                              }
                            },
                            width: width * 0.3,
                          )
                        ],
                      )
                    ],
                  )),
            )
          ],
        ));
  }
}
