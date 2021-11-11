// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String productName;
  final String price;
  final Color bkgColor;
  final int heroTag;
  const ProductItem(
      {Key? key,
      required this.heroTag,
      required this.image,
      required this.productName,
      required this.price, required this.bkgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      // crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Container(
            width: width,
            height: height * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: bkgColor,
            ),
            child: Hero(
                tag: 'productItem$heroTag',
                child: Image.asset(image, fit: BoxFit.fitHeight))),
        Text(productName,
            style: theme.textTheme.bodyText1!
                .copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Text(price,
            style: theme.textTheme.headline3!
                .copyWith(fontWeight: FontWeight.bold))
      ],
    );
  }
}
