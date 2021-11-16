// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delta/components/button.dart';
import 'package:delta/components/counter.dart';
import 'package:delta/model/cartModel.dart';
import 'package:delta/model/products.dart';
import 'package:delta/services/dataBase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final ProductModel products;
  const CartScreen({Key? key, required this.products}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController _counterValue = TextEditingController();

  // @override
  // void initState() {
  //   _counterValue.text = '0';
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<List<CartModel>>(context);
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return StreamProvider<List<CartModel>>.value(
      initialData: [],
      value: DbServices().carts,
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Container(
            alignment: Alignment(-0.9, 1),
            width: width,
            color: theme.primaryColor,
            padding: EdgeInsets.all(20),
            child: Text('MY CART', style: theme.textTheme.headline2),
          )),
          Expanded(
              flex: 3,
              child: carts.isEmpty
                  ? Center(
                      child: Text(
                      'No Items In Cart',
                      style: theme.textTheme.headline3,
                    ))
                  : ListView.builder(
                      itemCount: carts.length,
                      itemBuilder: (context, index) {
                        _counterValue.text = carts[index].itemCount;
                        double _currentPrice =
                            double.parse(carts[index].itemPrice);
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(1, 3),
                                blurRadius: 2,
                              )
                            ]),
                            child: ListTile(
                              //contentPadding: EdgeInsets.symmetric(horizontal:5,vertical:30),
                              leading: Container(
                                  width: width*0.15,
                                  height: height * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: widget.products.prodColor,
                                  ),
                                  child: Image.asset(carts[index].itemImage,
                                      fit: BoxFit.fitHeight)),
                              title: Padding(
                                padding: const EdgeInsets.only(bottom:8),
                                child: Text(carts[index].itemName,
                                    style: theme.textTheme.headline3!.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              subtitle: 
                              Text('GHS $_currentPrice',
                                  style: theme.textTheme.bodyText1),
                              trailing: CounterField(
                                controller: _counterValue,
                                width: width * 0.3,
                                btnSize: 30,
                                textColor: Colors.black,
                              ),
                            ),
                          ),
                        );
                      })),
        ],
      )),
    );
  }
}
