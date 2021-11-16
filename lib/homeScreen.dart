// ignore_for_file: file_names, prefer_const_constructors

import 'package:delta/model/products.dart';
import 'package:delta/screens/cart.dart';
import 'package:delta/screens/mapScreen.dart';
import 'package:flutter/material.dart';

import 'components/bottomNav.dart';
import 'components/categoryMenu.dart';
import 'components/textFields.dart';
import 'screens/productScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget? _content;
  

  @override
  void initState() {
    _content = MyHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(onChange: _handleNavigationChange),
      
      body: _content
      );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
           _content = CartScreen();
          break;
        case 1:
           _content = MyHome();
          break;
        case 2:
           _content = MapScreen();
          break;
      }
      _content = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _content,
      );
    });
  }
}

class MyHome extends StatefulWidget {
  const MyHome({ Key? key }) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int ct = 0;
  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;
    
    return  Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    color: theme.primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: CustomTextField(
                            hintText: 'Search',
                            hintColor: Colors.white,
                            style: theme.textTheme.bodyText2,
                            suffixIcon: Icon(Icons.search, color: Colors.white),
                            maxLines: 1,
                            color: theme.primaryColorLight.withOpacity(0.3),
                          ),
                        ),
                        //SizedBox(height:height*0.02),
                        //Icon(Icons.delivery_dining,color:theme.primaryColorDark,size:40),
                        SizedBox(height: height * 0.02),
                        Text('Delta', style: theme.textTheme.headline4),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 10),
                          child: Row(children: [
                            Expanded(
                              child: Divider(
                                color: Colors.white,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Icon(Icons.place,
                                  color: theme.primaryColorDark, size: 20),
                            ),
                            Expanded(
                              child: Divider(color: Colors.white),
                            )
                          ]),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 3,
                  child:
                      Container(color: Colors.white, 
                      child: ProductScreen(tag:ct))),
            ],
          ),
          Container(
              alignment: Alignment(0, -0.25),
              child: CategoryMenu(
                getCategory: (_catNum) {
                  setState(() {
                    ct = _catNum;
                  });
                },
              ))
        ],
      )
   ;
  }
}
