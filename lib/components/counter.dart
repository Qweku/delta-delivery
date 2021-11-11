// ignore_for_file: prefer_final_fields

import 'package:delta/components/textFields.dart';
import 'package:flutter/material.dart';

class CounterField extends StatefulWidget {
  final Color color;
  const CounterField({Key? key, this.color = Colors.black54}) : super(key: key);

  @override
  _CounterFieldState createState() => _CounterFieldState();
}

class _CounterFieldState extends State<CounterField> {
  int counter = 0;
  TextEditingController _counterValue = TextEditingController();
  @override
  void initState() {
    _counterValue.text = "0";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    return SizedBox(
        width: width * 0.5,
        child: Row(
          children: [
            GestureDetector(
                child: Container(
                  height: 50,
                  width: 50,
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
                    _counterValue.text = counter.toString();
                  });
                }),
            Expanded(
              child: CustomTextField(
                controller: _counterValue,
                //borderColor: Colors.black,
                textAlign: TextAlign.center,
                maxLines: 1,
                style: theme.textTheme.headline4,
                keyboard: TextInputType.number,
              ),
            ),
            GestureDetector(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: widget.color),
                  child: Icon(Icons.add, color: theme.primaryColorLight),
                ),
                onTap: () {
                  setState(() {
                    counter++;

                    _counterValue.text = counter.toString();
                  });
                }),
          ],
        ));
  }
}
