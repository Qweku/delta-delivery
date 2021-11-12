// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:delta/screens/productScreen.dart';
import 'package:flutter/material.dart';

class CategoryMenu extends StatefulWidget {
  final Function(int _category)? getCategory;
  const CategoryMenu({Key? key, this.getCategory}) : super(key: key);

  @override
  State<CategoryMenu> createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  int currentIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return Container(
        padding: EdgeInsets.only(left: 10),
        height: height * 0.15,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(
                  name.length, (index) => buildContainer(index: index))),
        ));
  }

  AnimatedContainer buildContainer({required int index}) {
    final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return AnimatedContainer(
        duration: Duration(milliseconds: 800),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 5),
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                widget.getCategory!(index);
              });
            },
            child: Container(
              padding: EdgeInsets.all(8),
              width: width * 0.25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      currentIndex == index ? theme.primaryColor : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 3),
                      blurRadius: 2,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    catIcons[index],
                    size: 30,
                    color: currentIndex == index
                        ? Colors.white
                        : theme.primaryColor,
                  ),
                  SizedBox(height: 5),
                  SizedBox(
                    width: width * 0.3,
                    child: Text(name[index],
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          color: currentIndex == index
                              ? Colors.white
                              : theme.primaryColor,
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
