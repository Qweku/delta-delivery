// ignore_for_file: prefer_final_fields

import 'package:delta/components/textFields.dart';
import 'package:flutter/material.dart';

class CounterField extends StatefulWidget {
  final Color color;
  final double? width;
  final Color textColor;
  final double btnSize;
  final TextEditingController controller;

  const CounterField({
    Key? key,
    this.color = Colors.black54,
    this.width,
    this.textColor = Colors.white,
    this.btnSize = 50,
    required this.controller,
  }) : super(key: key);

  @override
  _CounterFieldState createState() => _CounterFieldState();
}

class _CounterFieldState extends State<CounterField> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return SizedBox(
        width: widget.width,
        child: Row(
          
          children: [
            GestureDetector(
                child: Container(
                  height: widget.btnSize,
                  width: widget.btnSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: widget.color),
                  child: Icon(Icons.remove, color: theme.primaryColorLight),
                ),
                onTap: () {
                  setState(() {
                    counter--;
                    if (counter < 0) {
                      counter = 0;
                    }
                    widget.controller.text = counter.toString();
                  });
                }),
            Expanded(
              child: CustomTextField(
                controller: widget.controller,
                //borderColor: Colors.black,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: theme.textTheme.headline4!
                    .copyWith(color: widget.textColor),
                keyboard: TextInputType.number,
              ),
            ),
            GestureDetector(
                child: Container(
                  height: widget.btnSize,
                  width: widget.btnSize,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: widget.color),
                  child: Icon(Icons.add, color: theme.primaryColorLight),
                ),
                onTap: () {
                  setState(() {
                    counter++;

                    widget.controller.text = counter.toString();
                  });
                }),
          ],
        ));
  }
}
