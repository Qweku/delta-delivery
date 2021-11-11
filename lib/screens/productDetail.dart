// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields

import 'package:delta/components/button.dart';
import 'package:delta/components/counter.dart';
import 'package:delta/model/products.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel products;
  final int? tag;
  const ProductDetailScreen({Key? key, this.tag, required this.products})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
              padding: EdgeInsets.only(top:0),
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
                    Text(widget.products.prodPrice,
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
                          //color:widget.products.prodColor,
                          ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Button(
                            borderColor: widget.products.prodColor,
                            buttonText: 'Add To Cart',
                            onTap: () {},
                            width: width * 0.3,
                            shadowColor: Colors.transparent,
                          ),
                          Button(
                            color: widget.products.prodColor,
                            buttonText: 'Buy Now',
                            onTap: () {},
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
