// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delta/model/products.dart';
import 'package:delta/components/productItem.dart';
import 'package:delta/components/textFields.dart';
import 'package:flutter/material.dart';

import 'productDetail.dart';

class ProductScreen extends StatefulWidget {
  final int tag;
  const ProductScreen({Key? key, this.tag = 0}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isShown = false;
  List<ProductModel> products = [];

  // @override
  // void initState() {
  //   products = ProductModel().
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    if (widget.tag == 0) {
      products = ProductModel().productModelList(ProductModel().canned);
    } else {
      products = ProductModel().productModelList(ProductModel().drinks);
    }

    return Stack(
      children: [
        Container(
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/grocery.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.9), BlendMode.hardLight))),
        ),
        Column(
          children: [
            // Expanded(
            //     flex: 2,
            //     child: Container(
            //         width: width,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.only(
            //                 bottomRight: Radius.circular(40),bottomLeft:Radius.circular(40)),
            //             color: Colors.brown,
            //             image: DecorationImage(
            //                 image: AssetImage('assets/can-bkg.png'),
            //                 fit: BoxFit.cover,
            //                 colorFilter: ColorFilter.mode(
            //                     Colors.black.withOpacity(0.5),
            //                     BlendMode.hardLight))),
            //         child: Padding(
            //           padding: EdgeInsets.only(
            //               left: height * 0.03,
            //               right: height * 0.03,
            //               top: height * 0.08),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               CustomTextField(
            //                 hintText: 'Search',
            //                 hintColor:Colors.white,
            //                 style: theme.textTheme.bodyText2,
            //                 suffixIcon: Icon(Icons.search,color:Colors.white),
            //                 maxLines: 1,
            //                 color: theme.primaryColorLight.withOpacity(0.3),
            //               ),
            //               SizedBox(height: height * 0.15),
            //               Text('CANNED GOODS',
            //                   style: theme.textTheme.headline2!
            //                       .copyWith(fontWeight: FontWeight.bold)),
            //             ],
            //           ),
            //         ))),

            Expanded(
                //flex: 3,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: height * 0.04),
                    width: width,
                    child: GridView.builder(
                        padding: EdgeInsets.only(top: height * 0.08),
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.9,
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              ProductModel productItems = ProductModel(
                                  prodColor: products[index].prodColor,
                                  prodImage: products[index].prodImage,
                                  prodName: products[index].prodName,
                                  prodPrice: products[index].prodPrice);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(
                                          tag: index, products: productItems)));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: theme.primaryColorLight,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1, 2),
                                        blurRadius: 3,
                                      )
                                    ]),
                                child: ProductItem(
                                  bkgColor: products[index].prodColor,
                                  image: products[index].prodImage,
                                  productName: products[index].prodName,
                                  price: products[index].prodPrice,
                                  heroTag: index,
                                )),
                          );
                        })))
          ],
        ),
      ],
    );
  }
}
