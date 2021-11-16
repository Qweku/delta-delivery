// ignore_for_file: file_names, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FindingRider extends StatefulWidget {
  const FindingRider({Key? key}) : super(key: key);

  @override
  _FindingRiderState createState() => _FindingRiderState();
}

class _FindingRiderState extends State<FindingRider> {
  startTime() async {
    var _duration = Duration(seconds: 2);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {}

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: theme.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Searching your rider...', style: theme.textTheme.headline2),
            SizedBox(height: 20),
            Text('This will take a few moment',
                style: theme.textTheme.headline4),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: height * 0.08),
                child:SpinKitHourGlass(color: Colors.white,
                size: height*0.1,
                duration:Duration(milliseconds: 500))
              ),
            )
          ],
        ));
  }
}
