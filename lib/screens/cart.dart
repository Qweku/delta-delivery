// ignore_for_file: prefer_const_constructors

import 'package:delta/components/counter.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Container(
          color:theme.primaryColor,
          padding:EdgeInsets.all(20),
          child:Text('MY CART',style:theme.textTheme.headline2),
        )),
        Expanded(
            flex: 3,
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: Container(
            width: width,
            height: height * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green.withOpacity(0.4),
            ),
            child: Image.asset('assets/milo.png', fit: BoxFit.fitHeight)
            ),
            title:Text('Milo',style:theme.textTheme.headline3),
            subtitle: Text('GHS 17.00',style:theme.textTheme.bodyText1),
            trailing:CounterField(),
                    ),
                  );
                })),
      ],
    ));
  }
}
