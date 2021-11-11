// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delta/screens/productScreen.dart';
import 'package:flutter/material.dart';

class CategoryMenu extends StatefulWidget {
  const CategoryMenu({Key? key}) : super(key: key);

  @override
  State<CategoryMenu> createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  Color iconColor = Colors.black;
  Color textColor = Colors.black;
  Color bkgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    List<String> name = [
      'Canned Goods',
      'Drinks & Snacks',
      'Electrical & Electronics',
      'Beauty Care',
      'Frozen Foods',
      'Cleaning Supplies'
    ];
    List<IconData> catIcons = [
      Icons.shopping_basket,
      Icons.local_bar,
      Icons.tv,
      Icons.face,
      Icons.shopping_cart,
      Icons.soap
    ];
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
        padding: EdgeInsets.only(left: 10),
        height: height * 0.15,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: name.length,
            itemBuilder: (context, index) {
              //int currentIndex = index;
              return Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 5),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      for (int currentIndex = 0;
                          currentIndex < name.length;
                          currentIndex++) {
                        if (currentIndex == index) {
                          print('this is index $index');
                          setState(() {
                            iconColor = Colors.white;
                            textColor = Colors.white;
                            bkgColor = theme.primaryColor;
                          });
                        } else {
                          iconColor = theme.primaryColor;
                          textColor = Colors.black;
                          bkgColor = Colors.white;
                        }
                      }
                    });
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => ProductScreen()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: bkgColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 2),
                            blurRadius: 5,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(catIcons[index], size: 30, color: iconColor),
                        SizedBox(height: 5),
                        SizedBox(
                          width: width * 0.3,
                          child: Text(name[index],
                              textAlign: TextAlign.center,
                              style: theme.textTheme.bodyText1!
                                  .copyWith(fontSize: 14, color: textColor)),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
