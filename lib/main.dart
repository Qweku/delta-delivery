// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'homeScreen.dart';
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
    return  ThemeBuilder(
              themes: getThemes(),
              defaultThemeMode: ThemeMode.system,
              builder: (context, regularTheme, darkTheme, themeMode) =>
                  MaterialApp(
                title: 'Delta delivery system',
                home:HomeScreen(),
                theme: regularTheme,
                darkTheme: darkTheme,
                themeMode: themeMode,
                debugShowCheckedModeBanner: false,
              ),
            );
            }
}

