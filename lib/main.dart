// ignore_for_file: prefer_const_constructors

import 'package:delta/auth/authenticate.dart';
import 'package:delta/model/products.dart';
import 'package:delta/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'auth/authservices.dart';
import 'homeScreen.dart';
import 'model/cartModel.dart';
import 'services/dataBase.dart';
import 'themes.dart';

Future<void> main() async {
  await ThemeManager.initialise();  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();
    return  FutureBuilder(
       future: _init,
        builder: (context, snapshot) {
          return snapshot.hasData ? MultiProvider(
            providers: [
              ChangeNotifierProvider<AuthService>.value(value: AuthService()),
              StreamProvider<User?>.value(
                value: AuthService().user,
                initialData: null,
              ),
              ChangeNotifierProvider<Carts>.value(value: Carts()),
              Provider<ProductModel>.value(value: ProductModel()),
        //       StreamProvider<List<CartModel>>.value(
        // initialData: [],
        // value: DbServices().carts,)
            ],
      child: ThemeBuilder(
                  themes: getThemes(),
                  defaultThemeMode: ThemeMode.system,
                  builder: (context, regularTheme, darkTheme, themeMode) =>
                      MaterialApp(
                    title: 'Delta delivery system',
                    home:Wrapper(),
                    theme: regularTheme,
                    darkTheme: darkTheme,
                    themeMode: themeMode,
                    debugShowCheckedModeBanner: false,
                  ),
           ) ): MaterialApp(debugShowCheckedModeBanner: false,home: Loading());
      
        }
    );
            }
}

class Loading extends StatelessWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:CircularProgressIndicator()
      )
      
    );
  }
}


